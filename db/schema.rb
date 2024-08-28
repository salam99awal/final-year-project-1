# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_03_08_125946) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "assessment_masters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assessments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "assessment_master_id"
    t.integer "marks"
    t.integer "student_id"
    t.integer "teacher_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_master_id"
    t.integer "user_id"
    t.string "remarks"
    t.string "conduct"
    t.boolean "is_old"
    t.integer "term"
    t.boolean "grade_status"
  end

  create_table "class_fields", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classes_subjects", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "class_id", null: false
    t.bigint "subject_id", null: false
  end

  create_table "collect_fees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "amount_received"
    t.integer "student_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fees_type"
  end

  create_table "grades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "class_results"
    t.integer "exam_results"
    t.integer "student_id"
    t.integer "total_resullts"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_master_id"
    t.string "grading"
    t.string "remark"
    t.integer "term"
    t.boolean "is_old"
  end

  create_table "lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "title"
    t.text "objectives"
    t.integer "class_id"
    t.string "duration"
    t.text "procedures"
    t.integer "user_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "duration_after_teaching"
    t.datetime "time_lesson_ended"
    t.text "activities"
    t.text "review"
    t.text "skills"
    t.text "assesments"
    t.text "remarks"
    t.text "weekday"
    t.datetime "lesson_date"
    t.boolean "attendance_status"
    t.integer "subject_id"
  end

  create_table "misc_uploads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lesson_id"
  end

  create_table "note_uploads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "lesson_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "student_id"
    t.integer "from_class_id"
    t.integer "to_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "remarks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "teacher_remark"
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "teacher_conduct"
    t.integer "stud_id"
    t.integer "student_attendance"
    t.integer "overall_attendance"
    t.string "promoted_to"
  end

  create_table "report_forms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "resident_cost_per_day"
    t.integer "resident_no_of_days"
    t.integer "resident_books"
    t.integer "nr_cost_per_day"
    t.integer "nr_no_of_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "reopening"
    t.datetime "fist_visit"
    t.datetime "mid_exams"
    t.datetime "mid_break"
    t.datetime "second_visit"
    t.datetime "end_exams"
    t.datetime "vacation"
    t.integer "food_water"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setup_fees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
  end

  create_table "student_attendances", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "student_id"
    t.integer "class_id"
    t.boolean "present_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "students", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "admission_no"
    t.date "admission_date"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "class_id"
    t.date "date_of_birth"
    t.string "gender"
    t.string "blood_group"
    t.string "birth_place"
    t.integer "nationality_id"
    t.string "language"
    t.string "religion"
    t.integer "student_category_id"
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.integer "country_id"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.integer "remark_id"
    t.string "parent_name"
    t.integer "phone_number"
    t.index ["admission_no"], name: "index_students_on_admission_no", length: 10
    t.index ["class_id"], name: "index_students_on_batch_id"
    t.index ["first_name", "middle_name", "last_name"], name: "index_students_on_first_name_and_middle_name_and_last_name", length: 10
  end

  create_table "subject_masters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_master_id"
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "class_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subject_master_id"
  end

  create_table "user_classes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.integer "class_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "full_name"
    t.integer "role_id"
    t.integer "class_id"
    t.integer "subject_master_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
