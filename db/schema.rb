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

ActiveRecord::Schema.define(version: 20150408144940) do

  create_table "accounts", force: :cascade do |t|
    t.string   "numero_de_cuenta", limit: 255
    t.string   "tipo_de_cuenta",   limit: 255
    t.integer  "monto",            limit: 4
    t.integer  "client_id",        limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "accounts", ["client_id"], name: "index_accounts_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "last_name",   limit: 255
    t.integer  "identify",    limit: 4
    t.string   "address",     limit: 255
    t.integer  "local_phone", limit: 4
    t.integer  "phone",       limit: 4
    t.string   "email",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "operations", force: :cascade do |t|
    t.string   "cuenta_destino",    limit: 255
    t.string   "cuenta_origen",     limit: 255
    t.string   "tipo_de_pago",      limit: 255
    t.string   "tipo_de_operacion", limit: 255
    t.integer  "monto_operation",   limit: 4
    t.integer  "client_id",         limit: 4
    t.integer  "account_id",        limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "operations", ["account_id"], name: "index_operations_on_account_id", using: :btree
  add_index "operations", ["client_id"], name: "index_operations_on_client_id", using: :btree

  add_foreign_key "accounts", "clients"
  add_foreign_key "operations", "accounts"
  add_foreign_key "operations", "clients"
end
