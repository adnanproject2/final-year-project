class UpdateColumnToTasksDate < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :date, :date
  end
end
