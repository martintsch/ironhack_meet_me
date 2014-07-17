class Location < ActiveRecord::Base
  has_many :visits

  scope :last_created, ->(limit) { order(created_at: :desc).limit(limit) }

  def self.iron_find(id)
    where(id: id).first
  end

  def visits_in_month_of_year(month, year)
    date = Date.new(year, month, 01)
    visits.where("from_date >= ? AND to_date < ?", date, date.end_of_month)
  end
end
