class Category < ActiveRecord::Base
  has_and_belongs_to_many :posts
end
# == Schema Information
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

