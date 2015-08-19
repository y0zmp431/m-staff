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

ActiveRecord::Schema.define(:version => 20150819150018) do

  create_table "article_translations", :force => true do |t|
    t.integer  "article_id"
    t.string   "locale",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
    t.text     "text"
  end

  add_index "article_translations", ["article_id"], :name => "index_article_translations_on_article_id"
  add_index "article_translations", ["locale"], :name => "index_article_translations_on_locale"

  create_table "articles", :force => true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.string   "title"
    t.string   "section"
    t.text     "short_text"
    t.text     "text"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "published",  :default => true
  end

  create_table "articles_dogs", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "dog_id"
  end

  create_table "banners", :force => true do |t|
    t.string   "banner_type"
    t.string   "target_url"
    t.string   "title"
    t.text     "content"
    t.boolean  "disabled",    :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "contacts", :force => true do |t|
    t.string   "main_phone"
    t.text     "phones"
    t.string   "email"
    t.string   "skype"
    t.string   "gtalk"
    t.text     "adress"
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dogs", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.string   "fullname"
    t.boolean  "male"
    t.boolean  "for_sale",            :default => false, :null => false
    t.boolean  "for_love",            :default => false, :null => false
    t.boolean  "from_us",             :default => true,  :null => false
    t.date     "date_of_birth"
    t.text     "desc"
    t.string   "pedigree"
    t.boolean  "disabled",            :default => false, :null => false
    t.text     "owner_desc"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "sort_index",          :default => 100
    t.text     "medical_tests"
    t.text     "trophies"
    t.boolean  "in_kennel",           :default => false
    t.string   "litter_sym"
    t.date     "date_of_death"
  end

  create_table "dogs_photos", :id => false, :force => true do |t|
    t.integer "dog_id"
    t.integer "photo_id"
  end

  create_table "litters", :force => true do |t|
    t.string   "litter_sym"
    t.date     "date_of_birth"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
  end

  create_table "photos", :force => true do |t|
    t.boolean  "disabled"
    t.integer  "index_of_order"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "only_for_pets_album", :default => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], :name => "taggings_idx", :unique => true

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.integer "taggings_count", :default => 0
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",                                  :null => false
    t.string   "name",                                   :null => false
    t.boolean  "disabled",            :default => false, :null => false
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "roles_mask"
  end

end
