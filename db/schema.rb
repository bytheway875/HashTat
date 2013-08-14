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

ActiveRecord::Schema.define(:version => 20130814165136) do

  create_table "artists", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.string   "location"
    t.string   "tattoo_shop"
    t.string   "avatar",          :default => "hashlogo.png"
    t.string   "specialties"
    t.text     "bio"
    t.string   "instagram"
    t.string   "flickr"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "cover_photo"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.integer  "user_id"
    t.string   "tattoo_shop_url"
    t.string   "email"
    t.string   "phone"
    t.string   "color_scheme"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tattoo_id"
    t.text     "comment_content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "artist_id"
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

  create_table "tattoos", :force => true do |t|
    t.string   "picture"
    t.text     "description"
    t.string   "gender"
    t.string   "body_location"
    t.string   "studio"
    t.string   "artist_name"
    t.text     "hashtags"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "location"
    t.integer  "artist_id"
    t.string   "twitter_photo"
  end

  create_table "tweets", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "pulled_tweet_id"
    t.text     "text"
    t.text     "attached_photos"
    t.string   "handle"
    t.string   "hashtags"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
    t.text     "about_me"
    t.string   "location"
    t.integer  "tat_number"
    t.string   "fav_artist"
    t.text     "memorable_story"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false, :null => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "fk_one_vote_per_user_per_entity", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
