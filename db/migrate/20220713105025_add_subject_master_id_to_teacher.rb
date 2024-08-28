class AddSubjectMasterIdToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :subject_master_id, :integer
  end
end
