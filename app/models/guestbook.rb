class Guestbook < ActiveRecord::Base
end

# == Schema Information
#
# Table name: guestbooks
#
#  id         :integer(4)      not null, primary key
#  author     :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

