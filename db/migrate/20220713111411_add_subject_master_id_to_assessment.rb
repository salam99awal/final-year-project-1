class AddSubjectMasterIdToAssessment < ActiveRecord::Migration[5.2]
  def change
    add_column :assessments, :subject_master_id, :integer
  end
end
