class AddSubjectMasterIdToSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :subject_master_id, :integer
  end
end
