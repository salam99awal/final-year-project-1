class AddRemarkToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :remark, :string
  end
end
