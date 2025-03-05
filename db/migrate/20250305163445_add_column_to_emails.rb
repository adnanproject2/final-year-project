class AddColumnToEmails < ActiveRecord::Migration[7.1]
  def change
    add_column :email_histories, :subject, :string
  end
end
