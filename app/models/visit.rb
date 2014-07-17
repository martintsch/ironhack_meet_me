class Visit < ActiveRecord::Base
  belongs_to :location

  validates :user_name, presence: true, format: { with: /\A[a-zA-Z]*\z/ }
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :location_id, presence: true
end
