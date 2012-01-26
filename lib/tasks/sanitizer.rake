namespace :sanitize do
  task :posts => :environment do

    Post.all.each do |p|
      @body = p.body.gsub('href="/moxie/','href="/posts/')
      p.body = @body
      p.save!
    end

  end
end