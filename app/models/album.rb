class Album < ActiveRecord::Base
  belongs_to :publisher
  has_many :songs

  scope :recent, -> { where("released_on >= ? AND released_on <= ?" , Date.today - 4.months, Date.today + 4.months) }

  validates :name, presence: true, length: { in: 2..50 }
  validates :cover_art, presence: true
  validates :publisher_id, presence: true
  validates :released_on, presence: true, format: { with: /\A\d{4}-\d{2}-\d{2}\z/, message: "should be in the format YYYY-MM-DD" }
end
