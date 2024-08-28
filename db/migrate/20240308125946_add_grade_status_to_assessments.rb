class AddGradeStatusToAssessments < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :grade_status, :boolean
  end
end
