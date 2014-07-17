class Location < ActiveRecord::Base
  has_many :visits

  scope :last_created, ->(limit) { order(created_at: :desc).limit(limit) }

  validates :name, presence: true, length: { maximum: 30 }, format: { with: /\A[a-zA-Z]*\z/ }
  validates :city, presence: true

  def self.iron_find(id)
    where(id: id).first
  end

  def visits_in_month_of_year(month, year)
    date = Date.new(year, month, 01)
    visits.where("from_date >= ? AND to_date < ?", date, date.end_of_month)
  end
end
