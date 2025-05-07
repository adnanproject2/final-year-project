class AddColumnToTasksCategoryId < ActiveRecord::Migration[7.1]
  def change
    add_reference :tasks, :category, index: false
  end
end
