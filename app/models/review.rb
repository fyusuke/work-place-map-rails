# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  comment    :string(255)
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :integer
#  user_id    :integer
#
# Indexes
#
#  index_reviews_on_place_id_and_user_id  (place_id,user_id) UNIQUE
#

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :user_id, presence: true
  validates :place_id, presence: true
  validates :comment, presence: true
  validates :rating, presence: true, :inclusion => 1..5
end
