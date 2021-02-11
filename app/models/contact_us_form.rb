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
class ContactUsForm < ApplicationRecord
  belongs_to :user

  validates :message, presence: true
end
