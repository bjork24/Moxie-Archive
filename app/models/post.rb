class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :author
  has_and_belongs_to_many :categories
  
  # def self.by_month(year,month)
  #   get_month = Date.new(year,month)
  #   return Post.find(:all, :conditions => ["created_at BETWEEN ? AND ?", get_month, get_month.end_of_month ])
  # end
  
end
# == Schema Information
#
# Table name: posts
#
#  id             :integer(4)      not null, primary key
#  o_id           :integer(4)
#  title          :string(255)
#  body           :text
#  author_id      :integer(4)
#  allow_comments :boolean(1)
#  created_at     :datetime
#  updated_at     :datetime
#

