class CreateAccount < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :account_email
      t.integer :active, :default => 1
      t.timestamps
    end
  end
end
