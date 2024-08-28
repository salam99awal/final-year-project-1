class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.integer :assessment_master_id
      t.integer :marks
      t.integer :student_id
      t.integer :teacher_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
