class Account < ApplicationRecord
    validates :account_email, :uuid, uniqueness: true
    has_many :users, dependent: :destroy
    has_many :tasks, dependent: :destroy
    has_many :categories, dependent: :destroy
end