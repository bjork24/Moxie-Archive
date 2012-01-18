module PostsHelper
  
  def post_month_linker(year,month)
    month_name = get_month = Date.new(year,month).strftime("%B")
    posts = Post.posts_by_month(year,month).size
    if posts > 0
      link_to "#{month_name} - #{posts}", "/posts/#{year}/#{month}"
    else
      month_name
    end
  end
  
end
