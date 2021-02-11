# == Schema Information
#
# Table name: contact_us_forms
#
#  id         :bigint           not null, primary key
#  message    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
require 'test_helper'

class ContactUsFormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
