require 'test_helper'

class PhlogCommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

