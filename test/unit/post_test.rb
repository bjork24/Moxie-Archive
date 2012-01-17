require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

