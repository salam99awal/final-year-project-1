class AddTermToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :term, :integer
  end
end
