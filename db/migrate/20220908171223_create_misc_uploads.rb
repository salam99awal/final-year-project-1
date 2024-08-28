class CreateMiscUploads < ActiveRecord::Migration[5.2]
  def change
    create_table :misc_uploads do |t|
      t.integer :user_id
      t.string :file

      t.timestamps
    end
  end
end
