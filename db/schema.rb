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

ActiveRecord::Schema.define(version: 20140312140130) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "business_id"
    t.text     "address"
    t.string   "zip"
    t.string   "city"
    t.string   "contact_person"
    t.string   "contact_email"
    t.string   "sender_email"
    t.string   "contact_phone"
    t.string   "contact_fax"
    t.string   "url"
    t.string   "mob_url"
    t.integer  "default_reservation_time"
    t.integer  "schedule_time_interval"
    t.string   "weekdays",                    limit: 1
    t.integer  "release_day"
    t.integer  "release_vip_day"
    t.integer  "reservation_time_limit"
    t.integer  "regular_reservation_limit"
    t.integer  "unregular_reservation_limit"
    t.integer  "agent_interval"
    t.integer  "max_real_length"
    t.integer  "real_length_slot"
    t.string   "home_display",                limit: 1
    t.integer  "appointment_free"
    t.integer  "sort_order"
    t.string   "purpose_length_disp",         limit: 1
    t.string   "c_e_appointment_limit"
    t.integer  "week_of_month"
    t.string   "agent_run",                   limit: 1
    t.integer  "num_tab"
    t.string   "display_tab_name",            limit: 1
    t.string   "logo_link"
    t.string   "logo_image"
    t.string   "company_logo"
    t.string   "company_banner"
    t.string   "secondary_logo_image"
    t.string   "secondary_url"
    t.string   "update_url"
    t.string   "send_email",                  limit: 1
    t.string   "send_sms",                    limit: 1
    t.string   "forenoon_start"
    t.string   "forenoon_end"
    t.string   "afternoon_start"
    t.string   "afternoon_end"
    t.string   "morning_start_time"
    t.string   "evening_end_time"
    t.string   "close",                       limit: 1
    t.string   "appConfirm",                  limit: 1
    t.string   "reason_text"
    t.string   "display_receipt",             limit: 1
    t.string   "display_checkin",             limit: 1
    t.string   "is_def_cashReg",              limit: 1
    t.boolean  "display_reserve_btn"
    t.string   "mail_format"
    t.string   "massmail",                    limit: 1
    t.string   "massmail_internal",           limit: 1
    t.integer  "appoinment_reservation_day"
    t.boolean  "address_on_receipt"
    t.string   "toplogo_link"
    t.string   "comlogo_link"
    t.string   "combanner_link"
    t.boolean  "default_logo_display"
    t.boolean  "web_id_login"
    t.string   "green_box",                   limit: 1
    t.string   "display_cal",                 limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_admins", force: true do |t|
    t.integer  "company_id"
    t.string   "username"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.boolean  "is_feedback", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_templates", force: true do |t|
    t.string   "subject"
    t.text     "content"
    t.string   "email_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "footer_pages", force: true do |t|
    t.string   "name"
    t.string   "page_route"
    t.text     "content"
    t.boolean  "is_footer",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "content"
    t.boolean  "is_active",  default: true
    t.boolean  "is_default", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_types", force: true do |t|
    t.string   "payment_method"
    t.string   "payment_class"
    t.string   "payment_receiver"
    t.string   "client_number"
    t.boolean  "exact_charge"
    t.boolean  "is_case"
    t.integer  "sort_order"
    t.string   "status",           limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "role_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "default_name"
    t.string   "default_label"
    t.string   "default_value"
    t.boolean  "is_active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", force: true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "time_zone"
    t.integer  "language_id"
    t.string   "interval_time"
    t.string   "image"
    t.date     "birth_date"
    t.integer  "login_count",          default: 0,     null: false
    t.integer  "failed_login_count",   default: 0,     null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "term",                 default: false
    t.boolean  "suspend_notification", default: false
    t.boolean  "is_active",            default: false
    t.string   "registration_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
