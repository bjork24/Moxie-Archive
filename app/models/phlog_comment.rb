class PhlogComment < ActiveRecord::Base
  belongs_to :phlog
end
# == Schema Information
#
# Table name: phlog_comments
#
#  id         :integer(4)      not null, primary key
#  author     :string(255)
#  body       :text
#  phlog_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

