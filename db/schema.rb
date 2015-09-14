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

ActiveRecord::Schema.define(version: 20150914212711) do

  create_table "_unused_fact_linkedin", primary_key: "seq_num", force: true do |t|
    t.string "id",                      limit: 200
    t.string "first_name",              limit: 45
    t.string "last_name",               limit: 45
    t.string "maiden_name",             limit: 45
    t.string "formatted_name",          limit: 45
    t.string "phonetic_first_name",     limit: 45
    t.string "phonetic_last_name",      limit: 45
    t.string "fomatted_phonetic_name",  limit: 45
    t.string "headline",                limit: 45
    t.string "location",                limit: 45
    t.string "location_country_code",   limit: 45
    t.string "industry",                limit: 45
    t.string "distance",                limit: 45
    t.string "relation_to_viewer",      limit: 45
    t.string "current_share",           limit: 45
    t.string "num_of_connections",      limit: 45
    t.string "summary",                 limit: 45
    t.string "specialities",            limit: 45
    t.string "picture_url",             limit: 45
    t.string "public_profile_url",      limit: 45
    t.string "email_address",           limit: 45
    t.string "last_modified_timestamo", limit: 45
    t.string "proposal_comments",       limit: 45
    t.string "date_of_birth",           limit: 45
    t.string "associations",            limit: 45
    t.string "interests",               limit: 45
    t.string "phone_type",              limit: 45
    t.string "phone_number",            limit: 45
    t.string "fact_linkedincol",        limit: 45
  end

  create_table "_unused_fact_linkedin_education", primary_key: "seq_num", force: true do |t|
    t.string "id",             limit: 45
    t.string "school_name",    limit: 45
    t.string "field_of_study", limit: 45
    t.string "start_date",     limit: 45
    t.string "degree",         limit: 45
    t.string "end_date",       limit: 45
    t.string "activities",     limit: 45
    t.string "notes",          limit: 45
  end

  create_table "dim_birth_stars", force: true do |t|
    t.string  "name",      limit: 256, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_birth_stars", ["locale_id"], name: "FK_dim_birth_star_dim_locale", using: :btree

  create_table "dim_castes", force: true do |t|
    t.string  "name",      limit: 50, default: "0", null: false
    t.integer "locale_id",                          null: false
  end

  add_index "dim_castes", ["locale_id"], name: "FK_dim_caste_dim_locale", using: :btree

  create_table "dim_cities", force: true do |t|
    t.string  "name",      limit: 128, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_cities", ["locale_id"], name: "FK_dim_city_dim_locale", using: :btree

  create_table "dim_communities", force: true do |t|
  end

  create_table "dim_countries", force: true do |t|
    t.string  "name",                limit: 256, null: false
    t.integer "locale_id",                       null: false
    t.integer "country_new_code"
    t.integer "country_old_code"
    t.string  "country_abbrevation", limit: 10
  end

  add_index "dim_countries", ["locale_id"], name: "FK_dim_country_dim_locale", using: :btree

  create_table "dim_education_level", force: true do |t|
    t.string  "name",      limit: 128, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_education_level", ["locale_id"], name: "FK_dim_education_level_dim_locale", using: :btree

  create_table "dim_genders", force: true do |t|
    t.string "name", limit: 28, null: false
  end

  create_table "dim_languages", force: true do |t|
    t.string  "name",      limit: 256, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_languages", ["locale_id"], name: "FK_dim_language_dim_locale", using: :btree

  create_table "dim_locales", force: true do |t|
    t.string "name", limit: 50, null: false
  end

  create_table "dim_religions", force: true do |t|
    t.string  "name",      limit: 256, null: false
    t.integer "locale_id",             null: false
  end

  add_index "dim_religions", ["locale_id"], name: "FK_dim_religion_dim_locale", using: :btree

  create_table "dim_states", force: true do |t|
    t.string "name",   limit: 256, null: false
    t.string "locale", limit: 256
  end

  create_table "dim_zodiac_signs", force: true do |t|
    t.string  "name",        limit: 256, null: false
    t.date    "from_date",               null: false
    t.date    "to_date",                 null: false
    t.integer "language_id",             null: false
    t.integer "locale_id",               null: false
  end

  add_index "dim_zodiac_signs", ["language_id"], name: "FK_dim_zodiac_sign_dim_language", using: :btree
  add_index "dim_zodiac_signs", ["locale_id"], name: "FK_dim_zodiac_sign_dim_locale", using: :btree

  create_table "fact_facebook", id: false, force: true do |t|
    t.string  "id",                      limit: 64
    t.string  "about",                   limit: 64
    t.string  "age_range_min",           limit: 4
    t.string  "age_range_max",           limit: 4
    t.string  "bio",                     limit: 64
    t.string  "birthday",                limit: 10
    t.string  "context_mutual_friends",  limit: 128
    t.string  "context_mutual_likes",    limit: 128
    t.string  "user_currency",           limit: 8
    t.string  "device_hardware",         limit: 50
    t.string  "device_os",               limit: 50
    t.string  "education_school",        limit: 50
    t.string  "education_year",          limit: 50
    t.string  "education_concentration", limit: 50
    t.string  "education_type",          limit: 50
    t.string  "email",                   limit: 50
    t.string  "favorite_athletes",       limit: 50
    t.string  "favorite_teams",          limit: 50
    t.string  "first_name",              limit: 50
    t.string  "gender",                  limit: 50
    t.string  "hometown",                limit: 50
    t.string  "languages",               limit: 50
    t.string  "last_name",               limit: 50
    t.string  "locale",                  limit: 50
    t.string  "location",                limit: 50
    t.string  "middle_name",             limit: 50
    t.string  "name",                    limit: 50
    t.string  "name_format",             limit: 50
    t.string  "political",               limit: 50
    t.string  "quotes",                  limit: 50
    t.string  "relationship_status",     limit: 50
    t.string  "religion",                limit: 50
    t.string  "significant_other",       limit: 50
    t.integer "timezone"
    t.string  "website",                 limit: 50
    t.string  "work_employer",           limit: 50
    t.string  "work_location",           limit: 50
    t.string  "work_position",           limit: 50
    t.string  "work_start_date",         limit: 50
    t.string  "work_end_date",           limit: 50
    t.string  "project_with",            limit: 50
    t.string  "project_description",     limit: 50
    t.string  "project_start_date",      limit: 50
    t.string  "project_end_date",        limit: 50
    t.string  "family_relationship",     limit: 50
    t.string  "friendlists",             limit: 50
    t.string  "friends",                 limit: 50
    t.string  "interests",               limit: 50
    t.string  "likes",                   limit: 50
    t.string  "Column 50",               limit: 50
  end

  create_table "fact_linkedin_profile_positions", primary_key: "seq_num", force: true do |t|
    t.string   "linkedin_user_id",     limit: 200, null: false
    t.integer  "linkedin_position_id"
    t.string   "title",                limit: 200
    t.integer  "company_id"
    t.string   "company_name",         limit: 200
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "is_current",           limit: 10
    t.datetime "last_updated"
  end

  create_table "fact_linkedin_profiles", primary_key: "seq_num", force: true do |t|
    t.string   "unify_user_id",         limit: 200,  null: false
    t.string   "linkedin_user_id",      limit: 200,  null: false
    t.string   "first_name",            limit: 100
    t.string   "last_name",             limit: 100
    t.string   "headline",              limit: 2000
    t.string   "location",              limit: 200
    t.string   "location_country_code", limit: 3
    t.string   "industry",              limit: 200
    t.integer  "distance"
    t.string   "picture_url",           limit: 2000
    t.string   "public_profile_url",    limit: 2000
    t.datetime "last_updated"
  end

  create_table "unify_matchmakers", force: true do |t|
    t.string   "user_name",     limit: 128, default: "0", null: false
    t.string   "password",      limit: 128, default: "0", null: false
    t.string   "company_name",  limit: 128, default: "0", null: false
    t.string   "first_name",    limit: 56,  default: "0", null: false
    t.string   "last_name",     limit: 56,  default: "0", null: false
    t.string   "email_address", limit: 56,  default: "0", null: false
    t.string   "phone",                     default: "0", null: false
    t.string   "address_1",     limit: 128, default: "0", null: false
    t.string   "address_2",     limit: 128, default: "0", null: false
    t.string   "state",         limit: 25
    t.string   "city",          limit: 25
    t.integer  "country_id",                default: 0,   null: false
    t.integer  "locale_id",                 default: 0,   null: false
    t.datetime "last_updated",                            null: false
    t.string   "biz_location"
  end

  create_table "unify_matchmakers_mappings", force: true do |t|
    t.integer "matchmakers_id"
    t.integer "religion_id"
    t.integer "caste_id"
    t.integer "language_id"
  end

  create_table "unify_matchmakers_mappings_1", id: false, force: true do |t|
    t.integer "id"
    t.integer "matchmakers_id", null: false
    t.integer "country_id"
  end

  add_index "unify_matchmakers_mappings_1", ["matchmakers_id"], name: "matchmakers_id", using: :btree

  create_table "unify_matchmakers_mappings_old", force: true do |t|
    t.integer "matchmakers_id"
    t.integer "country_id"
    t.integer "religion_id"
    t.integer "caste_id"
    t.integer "language_id"
  end

  add_index "unify_matchmakers_mappings_old", ["caste_id"], name: "FK_dim_community_MM", using: :btree
  add_index "unify_matchmakers_mappings_old", ["country_id"], name: "FK_dim_country_MM", using: :btree
  add_index "unify_matchmakers_mappings_old", ["id"], name: "FK_unify_matchmakers_id", using: :btree
  add_index "unify_matchmakers_mappings_old", ["language_id"], name: "FK_dim_language_MM", using: :btree
  add_index "unify_matchmakers_mappings_old", ["religion_id"], name: "FK_dim_religion_MM", using: :btree

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
    t.integer  "gender_id",                                                      null: false
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

  create_table "unify_religion_lang_caste_mappings", id: false, force: true do |t|
    t.integer "matchmakers_id", null: false
    t.integer "religion_id",    null: false
    t.integer "language_id",    null: false
    t.integer "caste_id",       null: false
  end

  add_index "unify_religion_lang_caste_mappings", ["matchmakers_id"], name: "matchmakers_id", using: :btree
  add_index "unify_religion_lang_caste_mappings", ["matchmakers_id"], name: "matchmakers_id_2", using: :btree

  create_table "unify_users", primary_key: "user_id", force: true do |t|
    t.string   "email",             limit: 100, null: false
    t.string   "password",          limit: 45
    t.string   "password_digest",   limit: 300
    t.string   "first_name",        limit: 100, null: false
    t.string   "last_name",         limit: 100
    t.string   "user_type",         limit: 2,   null: false
    t.integer  "locale_id",                     null: false
    t.string   "organization_name", limit: 100
    t.string   "logo_image_name",   limit: 100
    t.datetime "last_updated"
  end

  add_index "unify_users", ["locale_id"], name: "FK_unify_login_dim_locale", using: :btree

  create_table "unify_vw_religion_lang_caste_mappings", id: false, force: true do |t|
    t.integer "religion_id",               default: 0,   null: false
    t.string  "religion_name", limit: 256,               null: false
    t.integer "language_id",               default: 0,   null: false
    t.string  "language_name", limit: 256,               null: false
    t.integer "caste_id",                  default: 0,   null: false
    t.string  "caste_name",    limit: 50,  default: "0", null: false
    t.integer "locale_id",                 default: 0,   null: false
    t.string  "locale_name",   limit: 50,                null: false
  end

end
