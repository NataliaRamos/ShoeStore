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

ActiveRecord::Schema.define(version: 20160427221846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "purchases", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "shoe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "buyer_id"
  end

  add_index "purchases", ["seller_id"], name: "index_purchases_on_seller_id", using: :btree
  add_index "purchases", ["shoe_id"], name: "index_purchases_on_shoe_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "shoe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sales", ["seller_id"], name: "index_sales_on_seller_id", using: :btree
  add_index "sales", ["shoe_id"], name: "index_sales_on_shoe_id", using: :btree

  create_table "sellers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "shoes", force: :cascade do |t|
    t.string   "name"
    t.string   "amount"
    t.integer  "seller_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "sold",       default: false
  end

  add_index "shoes", ["seller_id"], name: "index_shoes_on_seller_id", using: :btree

  add_foreign_key "purchases", "sellers"
  add_foreign_key "purchases", "shoes"
  add_foreign_key "sales", "sellers"
  add_foreign_key "sales", "shoes"
  add_foreign_key "shoes", "sellers"
end
