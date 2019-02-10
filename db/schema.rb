# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_190_209_221_649) do
  create_table 'comments', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'text'
    t.bigint 'user_id'
    t.bigint 'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'flagged', default: false
    t.index ['event_id'], name: 'index_comments_on_event_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'events', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.float 'lat'
    t.float 'lng'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'reports', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'comment_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['comment_id'], name: 'index_reports_on_comment_id'
    t.index ['user_id'], name: 'index_reports_on_user_id'
  end

  create_table 'users', options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'comments', 'events'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'reports', 'comments'
  add_foreign_key 'reports', 'users'
end
