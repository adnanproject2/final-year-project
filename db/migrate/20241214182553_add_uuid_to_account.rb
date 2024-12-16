class AddUuidToAccount < ActiveRecord::Migration[7.1]
  def change
    add_column :accounts, :uuid, :bigint
  end
end
