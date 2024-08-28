class CreateRemarks < ActiveRecord::Migration[5.2]
  def change
    create_table :remarks do |t|
      t.string :teacher_remark
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
