# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_05_06_032430) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "event_store_events", force: :cascade do |t|
    t.uuid "event_id", null: false
    t.string "event_type", null: false
    t.jsonb "metadata"
    t.jsonb "data", null: false
    t.datetime "created_at", null: false
    t.datetime "valid_at"
    t.index ["created_at"], name: "index_event_store_events_on_created_at"
    t.index ["event_id"], name: "index_event_store_events_on_event_id", unique: true
    t.index ["event_type"], name: "index_event_store_events_on_event_type"
    t.index ["valid_at"], name: "index_event_store_events_on_valid_at"
  end

  create_table "event_store_events_in_streams", force: :cascade do |t|
    t.string "stream", null: false
    t.integer "position"
    t.uuid "event_id", null: false
    t.datetime "created_at", null: false
    t.index ["created_at"], name: "index_event_store_events_in_streams_on_created_at"
    t.index ["event_id"], name: "index_event_store_events_in_streams_on_event_id"
    t.index ["stream", "event_id"], name: "index_event_store_events_in_streams_on_stream_and_event_id", unique: true
    t.index ["stream", "position"], name: "index_event_store_events_in_streams_on_stream_and_position", unique: true
  end

  create_table "postcategories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_postcategories_on_category_id"
    t.index ["post_id"], name: "index_postcategories_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comment_num", default: 0
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "subcriber_id"
    t.bigint "subcriber_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcriber_id"], name: "index_subscriptions_on_subcriber_id"
    t.index ["subcriber_to_id"], name: "index_subscriptions_on_subcriber_to_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "email", default: "", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "role"
    t.integer "comment_num", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "event_store_events_in_streams", "event_store_events", column: "event_id", primary_key: "event_id"
  add_foreign_key "postcategories", "categories"
  add_foreign_key "postcategories", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "subscriptions", "users", column: "subcriber_id"
  add_foreign_key "subscriptions", "users", column: "subcriber_to_id"
end
