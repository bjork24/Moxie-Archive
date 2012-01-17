class Phlog < ActiveRecord::Base
  has_many :phlog_comments
  belongs_to :author
end
# == Schema Information
#
# Table name: phlogs
#
#  id           :integer(4)      not null, primary key
#  o_id         :integer(4)
#  title        :string(255)
#  body         :text
#  thumbnail    :string(255)
#  photographer :string(255)
#  author_id    :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

