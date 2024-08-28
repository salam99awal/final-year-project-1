class AddIsOldToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :is_old, :Boolean
  end
end
