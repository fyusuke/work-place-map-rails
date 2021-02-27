# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  email        :string(255)
#  firebase_uid :string(255)
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class User < ApplicationRecord
  has_many :contact_us_forms
  has_many :reviews, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :firebase_uid, presence: true, uniqueness: true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, allow_nil: true # Twitter doesn't provice email address => allow_nil: true
end
