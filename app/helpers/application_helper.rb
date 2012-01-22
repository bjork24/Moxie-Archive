module ApplicationHelper
  
  def is_moderator?(author)
    moderators = %w{bjork24 nicole}
    true if moderators.include? author.downcase
  end
  
end
