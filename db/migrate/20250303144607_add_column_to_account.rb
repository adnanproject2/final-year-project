class AddColumnToAccount < ActiveRecord::Migration[7.1]
  def change
    add_reference :email_histories, :account, index: true
  end
end
