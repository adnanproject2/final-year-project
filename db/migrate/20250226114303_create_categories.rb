class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description 
      t.integer :status
      t.references :account, index: true
      t.timestamps
    end
  end
end
