class CreateStudentAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :student_attendances do |t|
      t.integer :student_id
      t.integer :class_id
      t.boolean :present_status

      t.timestamps
    end
  end
end
