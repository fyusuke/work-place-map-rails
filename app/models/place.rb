# == Schema Information
#
# Table name: places
#
#  id            :bigint           not null, primary key
#  address       :string(255)
#  category      :string(255)
#  group         :string(255)
#  latitude      :decimal(9, 6)
#  longitude     :decimal(9, 6)
#  name          :string(255)
#  opening_hours :string(255)
#  prefecture    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  gmap_place_id :string(255)
#
class Place < ApplicationRecord
  has_many :reviews
  # validates :category, presence: true
  # validates :name, presence: true, uniqueness: true
end
