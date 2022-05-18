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

ActiveRecord::Schema.define(version: 2022_05_17_014808) do

  create_table "courses", charset: "utf8mb4", force: :cascade do |t|
    t.string "course_name", limit: 50, comment: "课程名称"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50, comment: "员工姓名"
    t.integer "parent_id", default: 0, comment: "上级ID"
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
    t.integer "age", limit: 1, comment: "学生年龄"
    t.integer "teacher_id", comment: "老师ID,关联到teachers表"
    t.integer "is_active", limit: 1, default: 1, comment: "是否活跃,活跃:1 不活跃:2,默认活跃"
  end

  create_table "teacher_structures", charset: "utf8mb4", force: :cascade do |t|
    t.integer "teacher_id", comment: "老师ID"
    t.integer "super_id", comment: "上级ID"
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

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "username", limit: 30
    t.string "addr"
    t.integer "age", limit: 1
    t.date "birth"
    t.integer "sex", limit: 1
    t.integer "delete_time", default: 0
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
