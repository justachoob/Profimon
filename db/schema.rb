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

ActiveRecord::Schema.define(version: 20161130073023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string   "subject"
    t.integer  "profile_id"
    t.boolean  "completed",   default: false
    t.integer  "first_year",  default: 0
    t.integer  "second_year", default: 0
    t.integer  "third_year",  default: 0
    t.integer  "fourth_year", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "progress",    default: 0
  end

  create_table "courses", force: :cascade do |t|
    t.string   "subject"
    t.integer  "course_number"
    t.float    "grade"
    t.string   "profimon_name"
    t.integer  "profile_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "badge_id"
    t.integer  "status",        default: 0
    t.integer  "timesTaken",    default: 1
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "pname"
    t.string   "faculty"
    t.float    "current_gpa"
    t.integer  "num_of_courses_taken"
    t.string   "courses_taken"
    t.string   "badges"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "profimon_skills", force: :cascade do |t|
    t.string   "name"
    t.integer  "stamina"
    t.string   "subject"
    t.integer  "knowledge"
    t.integer  "homework"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "stamina"
    t.float    "gpa_required"
    t.integer  "knowledge"
    t.integer  "homework"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
  end

end
