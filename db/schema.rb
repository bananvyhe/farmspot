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

ActiveRecord::Schema.define(version: 2020_05_28_105632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "vk_id"
    t.bigint "user_id"
    t.datetime "appointment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
    t.index ["vk_id"], name: "index_appointments_on_vk_id"
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "list_id"
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_cards_on_list_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "text"
    t.datetime "chat_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_chats_on_role_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "chats_roles", id: false, force: :cascade do |t|
    t.bigint "chat_id"
    t.bigint "role_id"
    t.index ["chat_id", "role_id"], name: "index_chats_roles_on_chat_id_and_role_id"
    t.index ["chat_id"], name: "index_chats_roles_on_chat_id"
    t.index ["role_id"], name: "index_chats_roles_on_role_id"
  end

  create_table "clans", force: :cascade do |t|
    t.string "clan"
  end

  create_table "clients", force: :cascade do |t|
    t.float "ballance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.float "incoming"
    t.float "spent"
    t.integer "mescount"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.integer "parent_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "discussions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gameboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "cry", default: 0
    t.string "message"
    t.integer "karma", default: 0
    t.bigint "expirience", default: 0
    t.boolean "dead", default: false
    t.integer "pk", default: 0
    t.index ["user_id"], name: "index_gameboards_on_user_id"
  end

  create_table "groupsvks", force: :cascade do |t|
    t.string "namegroup"
    t.datetime "groupsvks_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inboxes", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "operation_id"
    t.text "amount"
    t.boolean "unaccepted"
    t.string "label"
    t.string "sha1_hash"
    t.integer "withdraw_amount"
    t.string "datetime"
    t.boolean "codepro"
    t.string "notification_type"
    t.string "currency"
    t.string "sender"
    t.string "check"
  end

  create_table "item_attributes", force: :cascade do |t|
    t.string "item_name"
    t.string "description"
    t.string "image"
  end

  create_table "kills", force: :cascade do |t|
    t.bigint "gameboard_id"
    t.datetime "starts_at_time_of_pk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gameboard_id"], name: "index_kills_on_gameboard_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_items", force: :cascade do |t|
    t.integer "qty", default: 0
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "description"
    t.bigint "item_attribute_id"
    t.index ["item_attribute_id"], name: "index_my_items_on_item_attribute_id"
    t.index ["user_id"], name: "index_my_items_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "clan_name"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "recordings", force: :cascade do |t|
    t.bigint "location_id"
    t.integer "temp"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_recordings_on_location_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "siteowners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "incoming"
    t.float "spent"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_siteowners_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "username"
    t.bigint "expirience"
    t.integer "karma"
    t.integer "vote_weight", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "visiblegroups", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "groupsvk_id"
    t.index ["groupsvk_id"], name: "index_visiblegroups_on_groupsvk_id"
    t.index ["user_id"], name: "index_visiblegroups_on_user_id"
  end

  create_table "vks", force: :cascade do |t|
    t.string "title"
    t.string "posted_at"
    t.string "thumb_map_img_as_div"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "raiting"
    t.string "v_like"
    t.string "v_views"
    t.string "medias_row"
    t.string "wall"
    t.string "url"
    t.bigint "groupsvk_id"
    t.index ["groupsvk_id"], name: "index_vks_on_groupsvk_id"
    t.index ["wall"], name: "index_vks_on_wall", unique: true
  end

  create_table "voodoos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.boolean "vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "voteable_type"
    t.bigint "voteable_id"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id"
  end

  add_foreign_key "cards", "lists"
  add_foreign_key "chats", "roles"
  add_foreign_key "chats", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "gameboards", "users"
  add_foreign_key "my_items", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "recordings", "locations"
  add_foreign_key "siteowners", "users"
end
