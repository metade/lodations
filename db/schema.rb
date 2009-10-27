# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091027123233) do

  create_table "canned_queries", :force => true do |t|
    t.integer  "idea_id"
    t.integer  "endpoint_id"
    t.string   "title"
    t.text     "sparql"
    t.string   "template"
    t.string   "variables"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "endpoints", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommendations", :force => true do |t|
    t.integer  "canned_query_id"
    t.integer  "source_id"
    t.integer  "destination_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", :force => true do |t|
    t.string   "uri"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
