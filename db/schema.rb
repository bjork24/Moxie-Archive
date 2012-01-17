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

ActiveRecord::Schema.define(:version => 20120117231255) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_posts", :id => false, :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "post_id",     :null => false
  end

  add_index "categories_posts", ["category_id", "post_id"], :name => "index_categories_posts_on_category_id_and_post_id", :unique => true

  create_table "comments", :force => true do |t|
    t.string   "author"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guestbooks", :force => true do |t|
    t.string   "author"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phlog_comments", :force => true do |t|
    t.string   "author"
    t.text     "body"
    t.integer  "phlog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phlogs", :force => true do |t|
    t.integer  "o_id"
    t.string   "title"
    t.text     "body"
    t.string   "thumbnail"
    t.string   "photographer"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "o_id"
    t.string   "title"
    t.text     "body"
    t.integer  "author_id"
    t.boolean  "allow_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
