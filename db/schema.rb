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

ActiveRecord::Schema[7.0].define(version: 2023_03_14_081131) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kasirs", force: :cascade do |t|
    t.string "nama"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kategoris", force: :cascade do |t|
    t.string "nama_kategori"
    t.text "deskripsi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produk_transaksis", force: :cascade do |t|
    t.integer "total"
    t.integer "discount"
    t.integer "produk_id"
    t.integer "transaksi_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "produks", force: :cascade do |t|
    t.string "nama_produk"
    t.text "deskripsi_produk"
    t.integer "harga"
    t.integer "stok"
    t.integer "kategori_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaksis", force: :cascade do |t|
    t.integer "jumlah_barang"
    t.integer "kasir_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
