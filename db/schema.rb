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

ActiveRecord::Schema.define(:version => 20120423094428) do

  create_table "medical_aid_plans", :force => true do |t|
    t.integer  "medical_aids_id"
    t.string   "PlanName",        :limit => 50
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "medical_aid_plans", ["PlanName"], :name => "index_medical_aid_plans_on_PlanName"
  add_index "medical_aid_plans", ["id"], :name => "index_medical_aid_plans_on_id"

  create_table "medical_aids", :force => true do |t|
    t.string   "name",          :limit => 20
    t.string   "tel",           :limit => 15
    t.text     "address"
    t.string   "fax",           :limit => 15
    t.string   "contactPerson", :limit => 50
    t.string   "city",          :limit => 15
    t.string   "province",      :limit => 25
    t.string   "country",       :limit => 100
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "medical_aids", ["id"], :name => "index_medical_aids_on_id"
  add_index "medical_aids", ["name"], :name => "index_medical_aids_on_name"

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
    t.integer  "people_id"
    t.integer  "aid_number"
    t.integer  "medical_aids_id"
    t.string   "status",          :limit => 15
    t.date     "joinDate"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "person_medical_aids", ["id"], :name => "index_person_medical_aids_on_id"
  add_index "person_medical_aids", ["medical_aids_id"], :name => "index_person_medical_aids_on_medical_aids_id"
  add_index "person_medical_aids", ["people_id"], :name => "index_person_medical_aids_on_people_id"

  create_table "person_relations", :id => false, :force => true do |t|
    t.integer  "person1_id"
    t.integer  "People_id"
    t.integer  "person2_id"
    t.integer  "relation_id"
    t.integer  "RelationType_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "person_relations", ["person1_id"], :name => "index_person_relations_on_person1_id"
  add_index "person_relations", ["person2_id"], :name => "index_person_relations_on_person2_id"
  add_index "person_relations", ["relation_id"], :name => "index_person_relations_on_relation_id"

  create_table "relation_types", :force => true do |t|
    t.string   "relationType", :limit => 30
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "relation_types", ["id"], :name => "index_relation_types_on_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
