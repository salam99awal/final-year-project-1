class AddSubjectMasterIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subject_master_id, :integer
  end
end
