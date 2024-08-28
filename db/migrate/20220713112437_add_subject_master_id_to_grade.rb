class AddSubjectMasterIdToGrade < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :subject_master_id, :integer
  end
end
