class AddColumnToTasksTime < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :time, :time
  end
end
