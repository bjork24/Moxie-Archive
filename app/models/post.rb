class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :author
  has_and_belongs_to_many :categories
  
  def self.years
    Post.select("created_at").map{ |item| item.created_at.year }.uniq
  end
  
  def self.posts_by_year(year)
    get_year = Date.new(year.to_i)
    Post.find(:all, :conditions => ["created_at BETWEEN ? AND ?", get_year, get_year.end_of_year ])
  end
  
  def self.posts_by_month(year,month)
    get_month = Date.new(year.to_i,month.to_i)
    Post.find(:all, :conditions => ["created_at BETWEEN ? AND ?", get_month, get_month.end_of_month ])
  end
  
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

