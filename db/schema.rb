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

ActiveRecord::Schema[7.0].define(version: 2023_04_17_204315) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.bigint "currency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_accounts_on_currency_id"
  end

  create_table "accounts_tags", id: false, force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "tag_id", null: false
  end

  create_table "accounts_ultimate_benificiary_owners", id: false, force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "ultimate_benificiary_owner_id", null: false
  end

  create_table "balances", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "balance_date"
    t.bigint "account_id", null: false
    t.bigint "exchange_rate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_balances_on_account_id"
    t.index ["exchange_rate_id"], name: "index_balances_on_exchange_rate_id"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.string "iso_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.bigint "from_currency_id", null: false
    t.bigint "to_currency_id", null: false
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_currency_id"], name: "index_exchange_rates_on_from_currency_id"
    t.index ["to_currency_id"], name: "index_exchange_rates_on_to_currency_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ultimate_benificiary_owners", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "currencies"
  add_foreign_key "balances", "accounts"
  add_foreign_key "balances", "exchange_rates"
  add_foreign_key "exchange_rates", "currencies", column: "from_currency_id"
  add_foreign_key "exchange_rates", "currencies", column: "to_currency_id"
end
