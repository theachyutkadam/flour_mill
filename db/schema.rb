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

ActiveRecord::Schema.define(version: 20180509111042) do

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",     limit: 255
    t.string   "middle_name",    limit: 255
    t.string   "last_name",      limit: 255
    t.string   "address",        limit: 255
    t.string   "mobile_num",     limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "mail",           limit: 255
    t.integer  "user_id",        limit: 4
    t.integer  "family_members", limit: 4
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.string   "expence_type", limit: 255
    t.float    "expence",      limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "operators", force: :cascade do |t|
    t.string   "first_name",        limit: 255
    t.string   "middle_name",       limit: 255
    t.string   "last_name",         limit: 255
    t.string   "permanent_address", limit: 255
    t.decimal  "salary",                        precision: 10
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "mobile",            limit: 255
    t.string   "mail",              limit: 255
    t.integer  "user_id",           limit: 4
  end

  add_index "operators", ["user_id"], name: "index_operators_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "customer_id",      limit: 4
    t.float    "payment_ammount",  limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "receiver",         limit: 255
    t.string   "giver",            limit: 255
    t.float    "previous_ammount", limit: 24
    t.float    "left_ammount",     limit: 24
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name", limit: 255
    t.decimal  "price",                    precision: 10
    t.float    "weight",       limit: 24
    t.integer  "customer_id",  limit: 4
    t.integer  "operator_id",  limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "payment_type", limit: 255
  end

  add_index "products", ["customer_id"], name: "index_products_on_customer_id", using: :btree
  add_index "products", ["operator_id"], name: "index_products_on_operator_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "role_id",                limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "customers", "users"
  add_foreign_key "operators", "users"
  add_foreign_key "products", "customers"
  add_foreign_key "products", "operators"
  add_foreign_key "users", "roles"
end
