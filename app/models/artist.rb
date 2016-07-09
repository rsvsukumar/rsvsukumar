class Artist < ActiveRecord::Base
  has_many :songs
  has_many :albums, through: :songs
  has_one :artist_profile

  validates :name, presence: true
end
