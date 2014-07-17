class Location < ActiveRecord::Base
  has_many :visits

  scope :last_created, ->(limit) { order(created_at: :desc).limit(limit) }

  def self.iron_find(id)
    where(id: id).first
  end
end
