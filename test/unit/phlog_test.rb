require 'test_helper'

class PhlogTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

