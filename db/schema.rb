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

ActiveRecord::Schema.define(version: 20141213060354) do

  create_table "dim_birth_star", force: true do |t|
    t.string  "name",      limit: 256, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_birth_star", ["locale_id"], name: "FK_dim_birth_star_dim_locale", using: :btree

  create_table "dim_caste", force: true do |t|
    t.string  "name",      limit: 50, default: "0", null: false
    t.integer "locale_id",                          null: false
  end

  add_index "dim_caste", ["locale_id"], name: "FK_dim_caste_dim_locale", using: :btree

  create_table "dim_city", force: true do |t|
    t.string  "name",      limit: 128, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_city", ["locale_id"], name: "FK_dim_city_dim_locale", using: :btree

  create_table "dim_community", force: true do |t|
    t.string  "name",      limit: 256, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_community", ["locale_id"], name: "FK_dim_community_dim_locale", using: :btree

  create_table "dim_country", force: true do |t|
    t.string  "name",      limit: 256, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_country", ["locale_id"], name: "FK_dim_country_dim_locale", using: :btree

  create_table "dim_education_level", id: false, force: true do |t|
    t.integer "id",                    null: false
    t.string  "name",      limit: 128, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_education_level", ["locale_id"], name: "FK_dim_education_level_dim_locale", using: :btree

  create_table "dim_gender", force: true do |t|
    t.string  "name",      limit: 28, null: false
    t.integer "locale_id",            null: false
  end

  add_index "dim_gender", ["locale_id"], name: "FK_dim_gender_dim_locale", using: :btree

  create_table "dim_language", force: true do |t|
    t.string  "name",      limit: 256, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_language", ["locale_id"], name: "FK_dim_language_dim_locale", using: :btree

  create_table "dim_locale", force: true do |t|
    t.string "description", limit: 50
  end

  create_table "dim_region_caste_language", id: false, force: true do |t|
    t.integer "region_id",   null: false
    t.integer "caste_id",    null: false
    t.integer "language_id", null: false
    t.integer "locale_id",   null: false
  end

  add_index "dim_region_caste_language", ["caste_id"], name: "FK_dim_region_caste_language_dim_caste", using: :btree
  add_index "dim_region_caste_language", ["language_id"], name: "FK_dim_region_caste_language_dim_language", using: :btree
  add_index "dim_region_caste_language", ["locale_id"], name: "FK_dim_region_caste_language_dim_locale", using: :btree

  create_table "dim_religion", force: true do |t|
    t.string  "name",      limit: 256, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_religion", ["locale_id"], name: "FK_dim_religion_dim_locale", using: :btree

  create_table "dim_state", force: true do |t|
    t.string  "name",      limit: 128, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_state", ["locale_id"], name: "FK_dim_state_dim_locale", using: :btree

  create_table "dim_values", id: false, force: true do |t|
    t.integer "id",                      null: false
    t.string  "value",       limit: 256, null: false
    t.integer "map_id",                  null: false
    t.string  "map_value",   limit: 256, null: false
    t.integer "map_id_2",                null: false
    t.string  "map_value_2", limit: 256, null: false
    t.string  "table_name",  limit: 56,  null: false
    t.date    "from_date"
    t.date    "to_date"
  end

  create_table "dim_zodiac_sign", force: true do |t|
    t.string  "name",        limit: 256, null: false
    t.date    "from_date",               null: false
    t.date    "to_date",                 null: false
    t.integer "language_id",             null: false
    t.integer "locale_id",               null: false
  end

  add_index "dim_zodiac_sign", ["language_id"], name: "FK_dim_zodiac_sign_dim_language", using: :btree
  add_index "dim_zodiac_sign", ["locale_id"], name: "FK_dim_zodiac_sign_dim_locale", using: :btree

  create_table "unify_matchmakers", force: true do |t|
    t.string   "user_name",     limit: 128, default: "0", null: false
    t.string   "password",      limit: 128, default: "0", null: false
    t.string   "company_name",  limit: 128, default: "0", null: false
    t.string   "first_name",    limit: 56,  default: "0", null: false
    t.string   "last_name",     limit: 56,  default: "0", null: false
    t.string   "email_address", limit: 56,  default: "0", null: false
    t.integer  "phone",                     default: 0,   null: false
    t.string   "address_1",     limit: 128, default: "0", null: false
    t.string   "address_2",     limit: 128, default: "0", null: false
    t.integer  "country_id",                default: 0,   null: false
    t.integer  "religion_id",               default: 0,   null: false
    t.integer  "language_id",               default: 0,   null: false
    t.integer  "community",                 default: 0,   null: false
    t.integer  "locale_id",                 default: 0,   null: false
    t.datetime "last_updated",                            null: false
  end

  add_index "unify_matchmakers", ["community"], name: "FK__dim_community", using: :btree
  add_index "unify_matchmakers", ["country_id"], name: "FK__dim_country", using: :btree
  add_index "unify_matchmakers", ["language_id"], name: "FK__dim_language", using: :btree
  add_index "unify_matchmakers", ["locale_id"], name: "FK_unify_matchmaker_dim_locale", using: :btree
  add_index "unify_matchmakers", ["religion_id"], name: "FK__dim_religion", using: :btree

  create_table "unify_partner_preferences", force: true do |t|
    t.string   "first_name",      limit: 128, null: false
    t.string   "last_name",       limit: 128, null: false
    t.integer  "gender",                      null: false
    t.integer  "date_of_birth",               null: false
    t.integer  "place_of_birth",              null: false
    t.integer  "time_of_birth",               null: false
    t.integer  "age",                         null: false
    t.integer  "language",                    null: false
    t.integer  "caste",                       null: false
    t.integer  "gothram",                     null: false
    t.integer  "birth_star",                  null: false
    t.integer  "zodiac_sign",                 null: false
    t.integer  "horoscope_match",             null: false
    t.integer  "height",                      null: false
    t.integer  "food_habits",                 null: false
    t.datetime "last_updated",                null: false
    t.integer  "drinking_habits",             null: false
    t.integer  "smoking_habits",              null: false
    t.integer  "body_type",                   null: false
    t.integer  "complexion",                  null: false
    t.integer  "physical_status",             null: false
    t.integer  "school"
    t.integer  "college"
    t.integer  "education_level"
    t.integer  "locale_id",                   null: false
  end

  add_index "unify_partner_preferences", ["locale_id"], name: "FK_unify_partner_preferences_dim_locale", using: :btree

  create_table "unify_prospects", force: true do |t|
    t.string   "user_name",          limit: 50,  default: "0",                   null: false
    t.string   "password",           limit: 128, default: "0",                   null: false
    t.string   "secret_questions",   limit: 128, default: "0",                   null: false
    t.string   "answer",             limit: 128, default: "0",                   null: false
    t.integer  "match_maker_id",                 default: 0,                     null: false
    t.string   "match_maker_name",   limit: 50,  default: "0",                   null: false
    t.string   "first_name",         limit: 50,  default: "0",                   null: false
    t.string   "last_name",          limit: 50,  default: "0",                   null: false
    t.integer  "gender_id",                      default: 0,                     null: false
    t.datetime "dob",                                                            null: false
    t.time     "dob_time",                       default: '2000-01-01 00:00:00', null: false
    t.string   "place_of_birth",     limit: 50,  default: "0",                   null: false
    t.integer  "age",                            default: 0,                     null: false
    t.integer  "language_id",                    default: 0,                     null: false
    t.integer  "caste_id",                       default: 0,                     null: false
    t.string   "gotram",             limit: 50,  default: "0",                   null: false
    t.integer  "birth_star_id",                  default: 0,                     null: false
    t.integer  "zodiac_id",                      default: 0,                     null: false
    t.string   "horoscope_match",    limit: 50,  default: "0",                   null: false
    t.integer  "height",                         default: 0,                     null: false
    t.string   "food_habits",        limit: 50,  default: "0",                   null: false
    t.string   "drinking_habits",    limit: 50,  default: "0",                   null: false
    t.string   "smoking_habits",     limit: 50,  default: "0",                   null: false
    t.string   "body_type",          limit: 50,  default: "0",                   null: false
    t.string   "complexion",         limit: 50,  default: "0",                   null: false
    t.string   "physical_status",    limit: 50,  default: "0",                   null: false
    t.string   "school",             limit: 50,  default: "0",                   null: false
    t.string   "college",            limit: 50,  default: "0",                   null: false
    t.integer  "education_level_id",             default: 0,                     null: false
    t.integer  "locale_id",                      default: 0,                     null: false
    t.datetime "last_updated",                                                   null: false
  end

  add_index "unify_prospects", ["birth_star_id"], name: "FK_unify_user_dim_birth_star", using: :btree
  add_index "unify_prospects", ["caste_id"], name: "FK_unify_user_dim_caste", using: :btree
  add_index "unify_prospects", ["gender_id"], name: "FK_unify_user_dim_gender", using: :btree
  add_index "unify_prospects", ["language_id"], name: "FK_unify_user_dim_language", using: :btree
  add_index "unify_prospects", ["locale_id"], name: "FK_unify_user_dim_locale", using: :btree
  add_index "unify_prospects", ["match_maker_id"], name: "FK_unify_user_unify_bureau", using: :btree
  add_index "unify_prospects", ["zodiac_id"], name: "FK_unify_user_dim_zodiac_sign", using: :btree

  create_table "unify_users", primary_key: "user_id", force: true do |t|
    t.string   "email",             limit: 100, null: false
    t.string   "password",          limit: 45
    t.string   "password_digest",   limit: 300
    t.string   "first_name",        limit: 100, null: false
    t.string   "last_name",         limit: 100
    t.string   "user_type",         limit: 2,   null: false
    t.string   "locale",            limit: 10,  null: false
    t.string   "organization_name", limit: 100
    t.string   "logo_image_name",   limit: 100
    t.datetime "last_updated"
  end

  add_index "unify_users", ["locale"], name: "FK_unify_login_dim_locale", using: :btree

end
