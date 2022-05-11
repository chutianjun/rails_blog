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

ActiveRecord::Schema.define(version: 2022_05_11_060523) do

  create_table "blogs", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "is_public", default: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "blogs_tags", charset: "utf8mb4", force: :cascade do |t|
    t.integer "blog_id"
    t.integer "tag_id"
  end

  create_table "tags", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "style"
    t.string "crypted_password", null: false
    t.string "salt", null: false
    t.string "email", limit: 80, default: "", null: false
  end

end
