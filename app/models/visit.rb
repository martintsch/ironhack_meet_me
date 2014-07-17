class Visit < ActiveRecord::Base
  belongs_to :location

  validates :user_name, presence: true, format: { with: /\A[a-zA-Z]*\z/ }
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :location_id, presence: true

  validate :from_date_is_before_to_date

  def from_date_is_before_to_date
    if from_date.to_i > to_date.to_i
      errors.add(:from_date, "can't be after to date")
    end
  end
end
