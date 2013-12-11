# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131023111116) do

  create_table "catalogs", force: true do |t|
    t.string   "name"
    t.integer  "kind",       limit: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_tables", force: true do |t|
    t.date    "log_date"
    t.string  "picture_address"
    t.string  "news_title"
    t.string  "news_address"
    t.integer "serial",          null: false
  end

  add_index "news_tables", ["serial"], name: "news_table_serial", unique: true, using: :btree

  create_table "oil_logs", force: true do |t|
    t.integer "high"
    t.integer "low"
    t.integer "log_week"
    t.integer "log_id",   null: false
    t.integer "oil_id",   null: false
  end

  create_table "oil_regions", force: true do |t|
    t.string "serial"
    t.string "taipei_n"
    t.string "taipei_s"
    t.string "new_tai_s"
    t.string "new_tai_e"
    t.string "new_tai_w"
    t.string "keelong"
    t.string "toyen_n"
    t.string "toyen_s"
    t.string "sin_shi"
    t.string "sin_s"
    t.string "sin_e"
    t.string "miao_n"
    t.string "miao_s"
    t.string "taichung_shi"
    t.string "taichung_san"
    t.string "taichung_hai"
    t.string "cyoka_n"
    t.string "cyoka_s"
    t.string "nantou_e"
    t.string "nantou_w"
    t.string "unling_san"
    t.string "unling_hai"
    t.string "kayi_shi"
    t.string "kayi_san"
    t.string "kayi_hai"
    t.string "tainan_shi"
    t.string "tainan_n"
    t.string "tainan_s"
    t.string "takao_n"
    t.string "takao_s"
    t.string "takao_e"
    t.string "takao_w"
    t.string "pingtung_ne"
    t.string "pingtung_sw"
    t.string "yilang"
    t.string "kalen"
    t.string "taitung"
  end

  create_table "stock_logs", force: true do |t|
    t.date    "log_date"
    t.integer "open"
    t.integer "high"
    t.integer "low"
    t.integer "close"
    t.integer "volume"
    t.integer "adj_close"
    t.integer "stock_table_id", null: false
  end

  add_index "stock_logs", ["stock_table_id", "log_date"], name: "stock_logs_stock_table_id_log_date", unique: true, using: :btree
  add_index "stock_logs", ["stock_table_id"], name: "stock_logs_stock_table_id", using: :btree

  create_table "stock_tables", force: true do |t|
    t.string "serial"
    t.string "name"
  end

  create_table "vegetable_logs", force: true do |t|
    t.integer  "price1"
    t.integer  "price2"
    t.integer  "price3"
    t.date     "log_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vegetable_id", null: false
  end

  create_table "vegetable_stats", force: true do |t|
    t.integer "vegetable_id",                       null: false
    t.integer "kind",         limit: 1, default: 0, null: false
    t.date    "log_date",                           null: false
    t.integer "avg_price1",             default: 0, null: false
    t.integer "avg_price2",             default: 0, null: false
    t.integer "avg_price3",             default: 0, null: false
    t.integer "max_price1",             default: 0, null: false
    t.integer "max_price2",             default: 0, null: false
    t.integer "max_price3",             default: 0, null: false
    t.integer "min_price1",             default: 0, null: false
    t.integer "min_price2",             default: 0, null: false
    t.integer "min_price3",             default: 0, null: false
  end

  add_index "vegetable_stats", ["kind"], name: "vegetable_stats_kind", using: :btree
  add_index "vegetable_stats", ["log_date"], name: "vegetable_stats_log_date", using: :btree
  add_index "vegetable_stats", ["vegetable_id", "kind", "log_date"], name: "vegetable_stats_vegetable_id_kind_log_date", unique: true, using: :btree

  create_table "vegetables", force: true do |t|
    t.string  "serial"
    t.string  "name"
    t.string  "r_name"
    t.integer "season",    limit: 1
    t.integer "kind",      limit: 1
    t.integer "form",      limit: 2
    t.boolean "is_hidden",           default: false, null: false
  end

  add_index "vegetables", ["serial"], name: "vegetable_serial", unique: true, using: :btree

end
