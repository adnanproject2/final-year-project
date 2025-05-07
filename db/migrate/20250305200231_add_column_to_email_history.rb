class AddColumnToEmailHistory < ActiveRecord::Migration[7.1]
  def change
    add_column :email_histories, :sent_at, :string
  end
end
