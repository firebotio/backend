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

ActiveRecord::Schema.define(version: 20150421202223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backend_apps", force: :cascade do |t|
    t.integer  "user_id",                  null: false
    t.string   "name"
    t.string   "uid"
    t.text     "description"
    t.jsonb    "metadata",    default: {}, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "backend_apps", ["deleted_at"], name: "index_backend_apps_on_deleted_at", where: "(deleted_at IS NULL)", using: :btree
  add_index "backend_apps", ["name", "user_id"], name: "index_backend_apps_on_name_and_user_id", unique: true, using: :btree
  add_index "backend_apps", ["uid"], name: "index_backend_apps_on_uid", unique: true, using: :btree

  create_table "components", force: :cascade do |t|
    t.string   "name",                    null: false
    t.jsonb    "models",     default: {}, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "components", ["name"], name: "index_components_on_name", unique: true, using: :btree

  create_table "compositions", force: :cascade do |t|
    t.integer  "component_id",    null: false
    t.integer  "composable_id",   null: false
    t.string   "composable_type", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "compositions", ["component_id", "composable_id"], name: "index_compositions_on_component_id_and_composable_id", unique: true, using: :btree

  create_table "logs", force: :cascade do |t|
    t.integer  "loggable_id"
    t.string   "loggable_type"
    t.integer  "responsible_id"
    t.string   "responsible_type"
    t.string   "type",             null: false
    t.text     "description"
    t.datetime "completed_at"
    t.datetime "deleted_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "logs", ["deleted_at"], name: "index_logs_on_deleted_at", where: "(deleted_at IS NULL)", using: :btree
  add_index "logs", ["loggable_id"], name: "index_logs_on_loggable_id", using: :btree
  add_index "logs", ["type"], name: "index_logs_on_type", using: :btree

  create_table "models", force: :cascade do |t|
    t.integer  "backend_app_id",              null: false
    t.jsonb    "schema",         default: {}, null: false
    t.string   "name",                        null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "models", ["backend_app_id", "name"], name: "index_models_on_backend_app_id_and_name", unique: true, using: :btree
  add_index "models", ["deleted_at"], name: "index_models_on_deleted_at", where: "(deleted_at IS NULL)", using: :btree

  create_table "payment_methods", force: :cascade do |t|
    t.integer  "liable_id"
    t.string   "liable_type"
    t.string   "brand"
    t.string   "name"
    t.string   "type"
    t.string   "uid"
    t.datetime "deleted_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "payment_methods", ["deleted_at"], name: "index_payment_methods_on_deleted_at", where: "(deleted_at IS NULL)", using: :btree
  add_index "payment_methods", ["liable_id"], name: "index_payment_methods_on_liable_id", using: :btree
  add_index "payment_methods", ["type"], name: "index_payment_methods_on_type", using: :btree

  create_table "tokens", force: :cascade do |t|
    t.integer  "tokenable_id"
    t.string   "tokenable_type"
    t.integer  "user_id",                     null: false
    t.string   "token",                       null: false
    t.string   "type",                        null: false
    t.string   "tokenable_uid"
    t.jsonb    "metadata",       default: {}, null: false
    t.datetime "deleted_at"
    t.datetime "expires_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "tokens", ["deleted_at"], name: "index_tokens_on_deleted_at", where: "(deleted_at IS NULL)", using: :btree
  add_index "tokens", ["token", "type"], name: "index_tokens_on_token_and_type", unique: true, using: :btree
  add_index "tokens", ["tokenable_id"], name: "index_tokens_on_tokenable_id", using: :btree
  add_index "tokens", ["tokenable_type"], name: "index_tokens_on_tokenable_type", using: :btree
  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", where: "(deleted_at IS NULL)", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
