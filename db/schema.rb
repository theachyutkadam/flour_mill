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

ActiveRecord::Schema.define(version: 20180721174618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "mobile_num"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "mail"
    t.integer  "user_id"
    t.integer  "family_members"
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.string   "expence_type"
    t.float    "expence"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "quantity"
    t.text     "description"
  end

  create_table "items", force: :cascade do |t|
    t.string   "item_name"
    t.integer  "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operators", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "permanent_address"
    t.decimal  "salary"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "mobile"
    t.string   "mail"
    t.integer  "user_id"
  end

  add_index "operators", ["user_id"], name: "index_operators_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "customer_id"
    t.float    "payment_ammount"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "receiver"
    t.string   "giver"
    t.float    "previous_ammount"
    t.float    "left_ammount"
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name"
    t.float    "price"
    t.float    "weight"
    t.integer  "customer_id"
    t.integer  "operator_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "payment_type"
    t.integer  "item_id"
  end

  add_index "products", ["customer_id"], name: "index_products_on_customer_id", using: :btree
  add_index "products", ["item_id"], name: "index_products_on_item_id", using: :btree
  add_index "products", ["operator_id"], name: "index_products_on_operator_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "customers", "users"
  add_foreign_key "operators", "users"
  add_foreign_key "products", "customers"
  add_foreign_key "products", "items"
  add_foreign_key "products", "operators"
  add_foreign_key "users", "roles"
end
