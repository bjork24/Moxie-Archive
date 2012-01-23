module PostsHelper
  
  def post_month_linker(year,month)
    month_name = get_month = Date.new(year,month).strftime("%b")
    posts = Post.posts_by_month(year,month).size
    if posts > 0
      link_to "#{month_name}", "/posts/#{year}/#{month}", :class => "posts#{posts}"
    else
      month_name
    end
  end
  
  def make_post_link(post)
    link_to post.title, "/posts/#{post.o_id}"
  end
  
end
