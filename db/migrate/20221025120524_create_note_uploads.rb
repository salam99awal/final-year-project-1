class CreateNoteUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :note_uploads do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
