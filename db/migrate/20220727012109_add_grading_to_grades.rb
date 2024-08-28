class AddGradingToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :grading, :string
  end
end
