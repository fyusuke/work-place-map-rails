# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :string(255)
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :integer
#  user_id    :integer
#
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
