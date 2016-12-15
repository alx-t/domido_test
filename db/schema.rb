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

ActiveRecord::Schema.define(version: 20161215135949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"
  enable_extension "citext"

  create_table "block_types", force: :cascade do |t|
    t.string   "block_type"
    t.integer  "length"
    t.integer  "height"
    t.integer  "depth"
    t.integer  "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blocks", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "block_type_id"
    t.uuid     "wall_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["block_type_id"], name: "index_blocks_on_block_type_id", using: :btree
    t.index ["wall_id"], name: "index_blocks_on_wall_id", using: :btree
  end

  create_table "coordinates", force: :cascade do |t|
    t.string   "coordinatable_type"
    t.uuid     "coordinatable_id"
    t.jsonb    "start"
    t.jsonb    "end"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["coordinatable_type", "coordinatable_id"], name: "index_coordinates_on_coordinatable_type_and_coordinatable_id", using: :btree
  end

# Could not dump table "elements" because of following StandardError
#   Unknown type 'element_type' for column 'element_type'

  create_table "houses", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer  "length"
    t.integer  "width"
    t.integer  "floors"
    t.integer  "floor_height"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "walls", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "house_id"
    t.string   "wall_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_walls_on_house_id", using: :btree
  end

  add_foreign_key "blocks", "block_types"
  add_foreign_key "blocks", "walls"
  add_foreign_key "elements", "walls"
  add_foreign_key "walls", "houses"
end
