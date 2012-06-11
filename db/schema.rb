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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120611121906) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "consultations", :force => true do |t|
    t.datetime "time"
    t.integer  "person_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "medical_aid_plan_id"
  end

  create_table "department_operations", :force => true do |t|
    t.integer  "department_id"
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "staff_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "dependencies", :force => true do |t|
    t.integer  "person_id"
    t.integer  "dependent_id"
    t.integer  "relation_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "diagnoses", :force => true do |t|
    t.integer  "soap_id"
    t.integer  "icd_id"
    t.text     "comments"
    t.datetime "time"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "icd_categories", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "icds", :force => true do |t|
    t.text     "description"
    t.integer  "icd_category_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "medical_aid_plans", :force => true do |t|
    t.integer  "medical_aid_id"
    t.string   "name",           :limit => 50
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "medical_aid_plans", ["id"], :name => "index_medical_aid_plans_on_id"
  add_index "medical_aid_plans", ["name"], :name => "index_medical_aid_plans_on_PlanName"

  create_table "medical_aids", :force => true do |t|
    t.string   "name",           :limit => 50,  :null => false
    t.string   "address",        :limit => 250
    t.string   "city",           :limit => 50
    t.string   "province",       :limit => 50
    t.string   "country",        :limit => 50
    t.string   "contact_person"
    t.string   "email",          :limit => 50
    t.string   "tel",            :limit => 15
    t.string   "fax",            :limit => 15
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "soap_id"
    t.integer  "department_operation_id"
    t.text     "comments"
    t.datetime "time"
    t.integer  "user_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "title",                  :limit => 5
    t.string   "first_name",             :limit => 50
    t.string   "surname",                :limit => 50
    t.date     "dob"
    t.string   "other_name",             :limit => 50
    t.string   "sex",                    :limit => 1
    t.string   "post_address",           :limit => 150
    t.string   "tel_home",               :limit => 15
    t.string   "tel_office",             :limit => 15
    t.string   "tel_mobile",             :limit => 50
    t.string   "email",                  :limit => 50
    t.string   "home_address",           :limit => 150
    t.string   "city",                   :limit => 50
    t.string   "township",               :limit => 50
    t.string   "province",               :limit => 50
    t.string   "post_code",              :limit => 10
    t.string   "nationality",            :limit => 50
    t.string   "pin",                    :limit => 15
    t.string   "employer",               :limit => 30
    t.string   "occupation",             :limit => 30
    t.integer  "user"
    t.string   "pin_image_file_name"
    t.string   "pin_image_content_type"
    t.integer  "pin_image_file_size"
    t.datetime "pin_image_updated_at"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "person_medical_aids", :force => true do |t|
    t.integer  "person_id"
    t.integer  "number"
    t.integer  "medical_aid_plan_id"
    t.string   "status",              :limit => 15
    t.date     "join_date"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "person_medical_aids", ["id"], :name => "index_person_medical_aids_on_id"
  add_index "person_medical_aids", ["medical_aid_plan_id"], :name => "index_person_medical_aids_on_medical_aids_id"
  add_index "person_medical_aids", ["person_id"], :name => "index_person_medical_aids_on_people_id"

  create_table "person_profiles", :force => true do |t|
    t.integer  "person_id"
    t.datetime "time"
    t.integer  "user_id"
    t.string   "comments"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "prices", :force => true do |t|
    t.decimal "price",               :precision => 10, :scale => 0
    t.integer "medical_aid_plan_id"
    t.integer "priceable_id"
    t.string  "priceable_type"
  end

  add_index "prices", ["priceable_id", "priceable_type"], :name => "index_prices_on_priceable_id_and_priceable_type"

  create_table "profile_items", :force => true do |t|
    t.integer  "person_profile_id"
    t.integer  "profile_type_id"
    t.string   "value"
    t.datetime "time"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "profile_sub_items", :force => true do |t|
    t.integer  "person_profile_id"
    t.integer  "profile_sub_type_id"
    t.string   "value"
    t.datetime "time"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "profile_sub_types", :force => true do |t|
    t.integer  "profile_type_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "profile_sub_values", :force => true do |t|
    t.integer  "profile_id"
    t.integer  "profile_sub_type_id"
    t.string   "value"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "profile_sub_values", ["profile_id"], :name => "index_profile_sub_values_on_profile_id"
  add_index "profile_sub_values", ["profile_sub_type_id"], :name => "index_profile_sub_values_on_profile_sub_type_id"

  create_table "profile_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "person_id"
    t.integer  "profile_type_id"
    t.string   "description"
    t.date     "time"
    t.integer  "user_id"
    t.boolean  "snapshot",        :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "profiles", ["person_id"], :name => "index_profiles_on_person_id"

  create_table "relations", :force => true do |t|
    t.string "name"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "soap_types", :force => true do |t|
    t.string   "name"
    t.text     "instructions"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "soaps", :force => true do |t|
    t.integer  "consultation_id"
    t.integer  "soap_type_id"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "username",               :default => ""
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "redirect"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "vitals", :force => true do |t|
    t.integer  "soap_id"
    t.datetime "time"
    t.string   "blood_pressure"
    t.integer  "pulse"
    t.decimal  "temperature",      :precision => 10, :scale => 0
    t.integer  "respiratory_rate"
    t.decimal  "height",           :precision => 10, :scale => 0
    t.decimal  "weight",           :precision => 10, :scale => 0
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "wait_lists", :force => true do |t|
    t.datetime "datetime_in",                                          :null => false
    t.integer  "person_id"
    t.string   "next_action",         :limit => 10
    t.string   "next_action_name",    :limit => 30
    t.boolean  "attended",                          :default => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.integer  "medical_aid_plan_id"
  end

  add_index "wait_lists", ["id"], :name => "index_wait_lists_on_id"
  add_index "wait_lists", ["person_id"], :name => "index_wait_lists_on_people_id"

end
