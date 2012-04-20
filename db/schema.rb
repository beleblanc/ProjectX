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

ActiveRecord::Schema.define(:version => 20120420105306) do

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

end
