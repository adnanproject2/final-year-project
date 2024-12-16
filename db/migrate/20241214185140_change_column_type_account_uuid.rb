class ChangeColumnTypeAccountUuid < ActiveRecord::Migration[7.1]
  def change
    change_column :accounts, :uuid, :string
  end
end
