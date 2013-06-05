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

ActiveRecord::Schema.define(:version => 20130518123933) do

  create_table "admins", :force => true do |t|
    t.string   "UserName"
    t.string   "PassWord"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "binh_baus", :force => true do |t|
    t.string   "TenBinhBau"
    t.text     "MoTaBinhBau"
    t.integer  "MaxSao"
    t.date     "NgayBatDau"
    t.date     "NgayKetThuc"
    t.boolean  "Active"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "LuotBinhBau", :default => 0
    t.integer  "LuotXem",     :default => 0
  end

  create_table "chi_tiet_binh_baus", :force => true do |t|
    t.integer  "binh_bau_id"
    t.integer  "tieu_chi_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "chi_tiet_truongs", :force => true do |t|
    t.integer  "chi_tiet_binh_bau_id"
    t.integer  "truong_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "lich_su_binh_baus", :force => true do |t|
    t.integer  "chi_tiet_truong_id"
    t.integer  "user_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "SoDiem",             :default => 0
  end

  create_table "nhan_xet_tqs", :force => true do |t|
    t.integer  "binh_bau_id"
    t.integer  "user_id"
    t.string   "NoiDung"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "nhan_xets", :force => true do |t|
    t.integer  "chi_tiet_binh_bau_id"
    t.integer  "truong_id"
    t.integer  "user_id"
    t.string   "NoiDung"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "tieu_chis", :force => true do |t|
    t.string   "TenTieuChi"
    t.text     "MoTaTieuChi"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "SoLuongBinhBau", :default => 0
  end

  create_table "truongs", :force => true do |t|
    t.string   "TenTruong"
    t.string   "LienLac"
    t.text     "GioiThieu"
    t.string   "ToaDo"
    t.string   "Logo"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "SoLuongBinhBau", :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "MaUser"
    t.string   "HoTen"
    t.boolean  "Active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
