class Author < ActiveRecord::Base
  has_many :posts
  has_many :phlogs
end
# == Schema Information
#
# Table name: authors
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

