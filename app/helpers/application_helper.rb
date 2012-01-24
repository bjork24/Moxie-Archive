module ApplicationHelper
  
  def is_moderator?(author)
    moderators = %w{bjork24 nicole dan}
    true if moderators.include? author.downcase
  end
  
  def prev_post_link(post)
    id = post.id.to_i - 1
    is_phlog = post.kind_of? Phlog
    if id > 0
      prev_post = is_phlog ? Phlog.find(id) : Post.find(id)
      prev_link = is_phlog ? make_phlog_link(prev_post) : make_post_link(prev_post)
      type = is_phlog ? "Phlog" : "Post"
      link_to raw("&larr; Previoius #{type}"), prev_link, { :class => "prev-post-link", :title => prev_post.title }
    end
  end
  
  def next_post_link(post)
    id = post.id.to_i + 1
    is_phlog = post.kind_of? Phlog
    last_id = is_phlog ? Phlog.last.id : Post.last.id
    if id <= last_id
      next_post = is_phlog ? Phlog.find(id) : Post.find(id)
      next_link = is_phlog ? make_phlog_link(next_post) : make_post_link(next_post)
      type = is_phlog ? "Phlog" : "Post"
      link_to raw("Next #{type} &rarr;"), next_link, { :class => "next-post-link", :title => next_post.title }
    end
  end
  
end
