class CreateEmailHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :email_histories do |t|
      t.references :task, index: true
      t.timestamps
    end
  end
end
