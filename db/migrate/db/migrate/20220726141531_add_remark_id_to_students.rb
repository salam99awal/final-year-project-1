class AddRemarkIdToStudents < ActiveRecord::Migration[5.2]

  def change

    add_column :students, :remark_id, :integer

  end

end