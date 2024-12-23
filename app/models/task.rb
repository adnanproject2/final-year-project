class Task < ApplicationRecord
  belongs_to :account

  scope :for_today, -> { where(date: Date.today).order(priority: :desc) }
  scope :for_upcoming, -> { where("date > ?", Date.today).order(date: :asc) }
  scope :completed, -> { where(status: 1) }
  scope :pending, -> { where(status: 0) }

end