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

ActiveRecord::Schema.define(version: 20161105040000) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                                      null: false
    t.boolean  "draft",                     default: false, null: false
    t.integer  "order",                     default: 0,     null: false
    t.string   "title_en",                                  null: false
    t.string   "title_ja",                                  null: false
    t.text     "image_url",   limit: 65535,                 null: false
    t.text     "content_en",  limit: 65535,                 null: false
    t.text     "content_ja",  limit: 65535,                 null: false
    t.text     "comment",     limit: 65535,                 null: false
    t.integer  "category_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["category_id"], name: "index_articles_on_category_id", using: :btree
    t.index ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                                 null: false
    t.integer  "order",                    default: 0, null: false
    t.string   "name_en",                              null: false
    t.string   "name_ja",                              null: false
    t.text     "image_url",  limit: 65535,             null: false
    t.text     "desc_en",    limit: 65535,             null: false
    t.text     "desc_ja",    limit: 65535,             null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "url",        limit: 65535, null: false
    t.text     "message_en", limit: 65535, null: false
    t.text     "message_ja", limit: 65535, null: false
    t.date     "date",                     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username",                        null: false
    t.string   "password_digest",                 null: false
    t.boolean  "admin",           default: false, null: false
    t.boolean  "approved",        default: false, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

end
