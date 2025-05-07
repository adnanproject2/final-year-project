class CreateTask < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :note 
      t.integer :status, :comment => "incomplete (0), complete(1), pending(2), skip(4)"
      t.references :account, index: true
      t.timestamps
    end
  end
end
