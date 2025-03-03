class Task < ApplicationRecord
  belongs_to :account
  belongs_to :category, optional: true
  has_many :email_histories, dependent: :destroy

  scope :for_today, -> { where(date: Date.today).order(priority: :desc) }
  scope :for_upcoming, -> { where("date > ?", Date.today).order(date: :asc) }
  scope :completed, -> { where(status: 1) }
  scope :pending, -> { where(status: 0) }


  scope :this_week, -> { where(date: Date.today.beginning_of_week..Date.today.end_of_week).order(priority: :desc) }
  scope :this_month, -> { where(date: Date.today.beginning_of_month..Date.today.end_of_month).order(priority: :desc) }


  # Priorities
  scope :urgent_and_important, -> { where(priority: '3') }
  scope :urgent_but_not_important, -> { where(priority: '2') }
  scope :important_but_not_urgent, -> { where(priority: '1') }
  scope :neither_urgent_nor_important, -> { where(priority: '0') }
  scope :no_priority_set, -> { where(priority: '') }


  def fetch_priority
    case self.priority 
    when '3'
      'Urgent & Important'
    when '2'
      'Urgent but not Important'
    when '1'
      'Important but not Urgent'
    when '0'
      'Neither urgent nor Important'
    else
      "Not Prioritize!"
    end 
  end
end