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

ActiveRecord::Schema.define(version: 2019_10_20_201513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baby_names", id: false, force: :cascade do |t|
    t.text "state"
    t.text "gender"
    t.integer "year"
    t.text "fname"
    t.integer "number"
  end

  create_table "bronze_medals", id: false, force: :cascade do |t|
    t.string "noc", limit: 3
    t.bigint "count"
  end

  create_table "bronze_tmp", id: false, force: :cascade do |t|
    t.string "noc", limit: 3
    t.bigint "count"
  end

  create_table "cars", id: :integer, default: nil, force: :cascade do |t|
    t.text "name"
    t.integer "price"
  end

  create_table "comment_likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_likes_on_comment_id"
    t.index ["user_id"], name: "index_comment_likes_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.integer "likes_count"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", primary_key: "cid", id: :integer, default: nil, force: :cascade do |t|
    t.text "name"
    t.integer "units"
  end

  create_table "daily_show_guests", id: false, force: :cascade do |t|
    t.integer "year"
    t.text "job_title"
    t.date "date_of_appearance"
    t.text "profession"
    t.text "name"
  end

  create_table "female_names", id: false, force: :cascade do |t|
    t.text "fname"
    t.bigint "sum"
  end

  create_table "flights", id: false, force: :cascade do |t|
    t.integer "fid"
    t.integer "year"
    t.integer "month"
    t.integer "day_of_month"
    t.integer "day_of_week"
    t.text "carrier_id"
    t.integer "flight_num"
    t.text "origin_city"
    t.text "origin_state"
    t.text "dest_city"
    t.text "dest_state"
    t.float "departure_delay"
    t.float "taxi_out"
    t.float "arrival_delay"
    t.integer "cancelled"
    t.float "actual_time"
    t.float "distance"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "user1_id"
    t.bigint "user2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "are_friends"
    t.index ["user1_id"], name: "index_friends_on_user1_id"
    t.index ["user2_id"], name: "index_friends_on_user2_id"
  end

  create_table "gender_neutral_names", id: false, force: :cascade do |t|
    t.text "fname"
    t.bigint "Female Sum"
    t.bigint "Male Sum"
    t.bigint "Total"
    t.decimal "Ratio"
  end

  create_table "gold_medals", id: false, force: :cascade do |t|
    t.string "noc", limit: 3
    t.bigint "count"
  end

  create_table "gold_tmp", id: false, force: :cascade do |t|
    t.string "noc", limit: 3
    t.bigint "count"
  end

  create_table "grades", id: false, force: :cascade do |t|
    t.integer "sid"
    t.integer "cid"
    t.string "letter_grade", limit: 2
  end

  create_table "greetings", id: false, force: :cascade do |t|
    t.text "a"
    t.text "b"
  end

  create_table "male_names", id: false, force: :cascade do |t|
    t.text "fname"
    t.bigint "sum"
  end

# Could not dump table "medalists" because of following StandardError
#   Unknown type 'gender_type' for column 'gender'

  create_table "medals_tally", id: false, force: :cascade do |t|
    t.string "noc", limit: 3
    t.bigint "Bronze"
    t.bigint "Silver"
    t.bigint "Gold"
    t.bigint "total"
  end

  create_table "nocs", id: false, force: :cascade do |t|
    t.string "noc", limit: 3
  end

  create_table "post_likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_likes_on_post_id"
    t.index ["user_id"], name: "index_post_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "trip_id"
    t.string "tagline"
    t.integer "like_count"
    t.integer "comments_count"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_posts_on_trip_id"
  end

  create_table "reviews", id: false, force: :cascade do |t|
    t.serial "id", null: false
    t.text "movie"
    t.integer "rating"
  end

# Could not dump table "rides" because of following StandardError
#   Unknown type 'user_type' for column 'usertype'

  create_table "silver_medals", id: false, force: :cascade do |t|
    t.string "noc", limit: 3
    t.bigint "count"
  end

  create_table "students", primary_key: "sid", id: :integer, default: nil, force: :cascade do |t|
    t.text "name"
    t.decimal "gpa", precision: 3, scale: 2
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "user_id"
    t.string "from_location"
    t.string "to_location"
    t.integer "distance"
    t.date "start_date"
    t.date "end_date"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "profile_image_url"
    t.string "bio"
    t.integer "friends_count"
    t.integer "miles_travelled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comment_likes", "comments"
  add_foreign_key "comment_likes", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "friends", "users", column: "user1_id"
  add_foreign_key "friends", "users", column: "user2_id"
  add_foreign_key "post_likes", "posts"
  add_foreign_key "post_likes", "users"
  add_foreign_key "posts", "trips"
  add_foreign_key "trips", "users"
end
