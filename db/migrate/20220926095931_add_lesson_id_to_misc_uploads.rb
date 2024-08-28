class AddLessonIdToMiscUploads < ActiveRecord::Migration[5.2]
  def change
    add_column :misc_uploads, :lesson_id, :integer
  end
end
