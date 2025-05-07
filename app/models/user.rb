class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable, :lockable

  # Validations 
  validates :email, uniqueness: true

  # Associations
  belongs_to :account, optional: true

  # Calllbacks
  after_create :create_user_account

  before_destroy do
    self.account.update(active: 0) 
  end

  private
  def create_user_account
    account = Account.find_by_account_email(self.email)
    if account.present?
      account.update(active: 1)
    else
      account = Account.create(account_email: self.email, uuid: serialize_account_uuid)
    end
    self.update(account_id: account.id)
  end

  def serialize_account_uuid
    require 'securerandom'
    random_string = SecureRandom.hex
    Account.find_by_uuid(random_string).present? ? serialize_account_uuid : random_string 
  end
end
