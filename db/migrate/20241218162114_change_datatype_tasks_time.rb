class ChangeDatatypeTasksTime < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :time, :string
  end
end
