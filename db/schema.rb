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

ActiveRecord::Schema.define(version: 20160612181419) do

  create_table "admins", force: :cascade do |t|
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
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.integer  "user_id",                 limit: 4
    t.string   "title",                   limit: 255
    t.text     "company_description",     limit: 65535
    t.text     "company_needs",           limit: 65535
    t.string   "sector",                  limit: 255
    t.string   "country",                 limit: 255
    t.string   "targeted_time_to_market", limit: 255
    t.string   "expected_trl",            limit: 255
    t.string   "state",                   limit: 255
    t.datetime "expires_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "campaigns", ["user_id"], name: "index_campaigns_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "campaign_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "likes", ["campaign_id"], name: "index_likes_on_campaign_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "proposed_solutions", force: :cascade do |t|
    t.integer  "user_id",                 limit: 4
    t.integer  "campaign_id",             limit: 4
    t.string   "link",                    limit: 255
    t.string   "attachment",              limit: 255
    t.text     "technology_description",  limit: 65535
    t.text     "technology_application",  limit: 65535
    t.text     "patents",                 limit: 65535
    t.string   "trl",                     limit: 255
    t.boolean  "licence_available"
    t.string   "institution",             limit: 255
    t.text     "expectations",            limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "attachment_file_name",    limit: 255
    t.string   "attachment_content_type", limit: 255
    t.integer  "attachment_file_size",    limit: 4
    t.datetime "attachment_updated_at"
  end

  add_index "proposed_solutions", ["campaign_id"], name: "index_proposed_solutions_on_campaign_id", using: :btree
  add_index "proposed_solutions", ["user_id"], name: "index_proposed_solutions_on_user_id", using: :btree

  create_table "slider_items", force: :cascade do |t|
    t.string   "title",                    limit: 255
    t.string   "link",                     limit: 255
    t.boolean  "active"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "slide_image_file_name",    limit: 255
    t.string   "slide_image_content_type", limit: 255
    t.integer  "slide_image_file_size",    limit: 4
    t.datetime "slide_image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "role",                   limit: 255
    t.boolean  "active",                             default: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "title",                  limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "position",               limit: 255
    t.string   "company",                limit: 255
    t.string   "telephone",              limit: 255
    t.string   "mobile",                 limit: 255
    t.string   "address",                limit: 255
    t.string   "zip_code",               limit: 255
    t.string   "city",                   limit: 255
    t.string   "country",                limit: 255
    t.string   "number_of_employees",    limit: 255
    t.string   "company_website",        limit: 255
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
