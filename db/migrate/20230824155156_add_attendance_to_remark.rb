class AddAttendanceToRemark < ActiveRecord::Migration[5.2]
  def change
    add_column :remarks, :student_attendance, :integer
    add_column :remarks, :overall_attendance, :integer
    add_column :remarks, :promoted_to, :string
  end
end
