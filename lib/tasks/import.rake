namespace :import do
  task :legacy => :environment do

    class OldDb < ActiveRecord::Base
      establish_connection :legacy_db
    end

    class OldPost < OldDb
      set_table_name 'posts'
      set_primary_key 'id'
      default_scope order('posts.time ASC')
    end
    
    class OldCategories < OldDb
      set_table_name 'pigeonholes'
      set_primary_key 'id'
    end
    
    class OldComments < OldDb
      set_table_name 'comments'
      set_primary_key 'id'
    end
    
    class OldPhlogs < OldDb
      set_table_name 'phlogs'
      set_primary_key 'id'
    end
    
    class OldGuestbook < OldDb
      set_table_name 'guestbook'
      set_primary_key 'id'
    end

    # Set Categories
    OldCategories.all.each do |c|
      Category.create(
        :name => c.pigeonhole,
        :description => c.description
      )
    end
    
    # Zip through old posts
    OldPost.all.each do |p| 
      @author = Author.find_by_name(p.author) ? Author.find_by_name(p.author) : Author.create(:name => p.author)
      @categories = []
      p.pigeonhole.split(",").each do |c|
        @categories << Category.find(c)
      end
      @body = p.body.gsub('href="/moxie/post/','href="/posts/')
      @body = @body.gsub('src="/moxie/pix/','src="http://moxie.danchilton.com/pix/')
      @body = @body.gsub('href="pix/','href="http://moxie.danchilton.com/pix')
      @body = @body.gsub('href="/moxie/pix/','href="http://moxie.danchilton.com/pix/')
      post = Post.create(
        :o_id => p.id,
        :title  => p.title,
        :body => @body,
        :created_at => Time.at(p.time).to_datetime,
        :author_id => @author.id,
        :categories => @categories,
        :allow_comments => p.comments == 'true' ? true : false
      )
    end
    
    # Zip through old phlogs
    OldPhlogs.all.each do |p|
      @author = Author.find_by_name(p.caption_author) ? Author.find_by_name(p.caption_author) : Author.create(:name => p.caption_author)
      @body = p.body.gsub('src="/moxie/phlog/pix/','src="http://moxie.danchilton.com/pix/phlog/')
      phlog = Phlog.create(
        :o_id => p.id,
        :title  => p.title,
        :body => @body,
        :created_at => Time.at(p.time).to_datetime,
        :author_id => @author.id,
        :photographer => p.picture_author,
        :thumbnail => p.thumbnail
      )
    end
    
    # do post comments
    OldComments.all.each do |c|
      if not c.post_id.blank?
        is_phlog = c.post_id.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? true : false
        if is_phlog
          o_id = c.post_id.gsub("PHLOG_","")
          phlog = Phlog.find_by_o_id(o_id)
          phlog.phlog_comments.create(
            :author => c.name,
            :body => c.body,
            :phlog_id => phlog.id,
            :created_at => Time.at(c.time).to_datetime
          )
        else
          post = Post.find_by_o_id(c.post_id)
          post.comments.create(
            :author => c.name,
            :body => c.body,
            :post_id => post.id,
            :created_at => Time.at(c.time).to_datetime
          )
        end
      end
    end
    
    # guestbook
    OldGuestbook.all.each do |g|
      Guestbook.create(
        :author => g.name,
        :body => g.body,
        :created_at => Time.at(g.time.to_i).to_datetime
      )
    end

  end
end