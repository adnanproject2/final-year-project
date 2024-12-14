class Account < ApplicationRecord
    validates :account_email, :uuid, uniqueness: true
    has_many :users, dependent: :destroy
end