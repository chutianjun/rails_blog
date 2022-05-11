# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_11_065430) do

  create_table "courses", charset: "utf8mb4", force: :cascade do |t|
    t.string "course_name", limit: 50, comment: "课程名称"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scores", charset: "utf8mb4", force: :cascade do |t|
    t.integer "score", limit: 1, comment: "分数"
    t.integer "student_id", comment: "学生ID"
    t.string "course_id", comment: "课程ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", limit: 30, comment: "学生姓名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teachers", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", comment: "老师姓名"
    t.integer "age", limit: 1, comment: "年龄"
    t.text "description", comment: "描述"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "is_free", limit: 1, comment: "是否空闲"
  end

end
