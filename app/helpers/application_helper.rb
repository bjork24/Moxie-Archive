module ApplicationHelper
  
  def is_moderator?(author)
    moderators = %w{bjork24 nicole dan}
    true if moderators.include? author.downcase
  end
  
end
