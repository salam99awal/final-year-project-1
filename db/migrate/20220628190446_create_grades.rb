class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.integer :class_results
      t.integer :exam_results
      t.integer :student_id
      t.integer :total_resullts
      t.integer :subject_id

      t.timestamps
    end
  end
end
