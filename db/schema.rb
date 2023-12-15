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

ActiveRecord::Schema[7.1].define(version: 2023_12_15_123130) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currency_rates", force: :cascade do |t|
    t.date "date", null: false
    t.integer "currency_code", null: false
    t.decimal "rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "currency_code"], name: "index_currency_rates_on_date_and_currency_code", unique: true
  end

end
