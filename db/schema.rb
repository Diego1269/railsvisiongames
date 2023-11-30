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

ActiveRecord::Schema[7.1].define(version: 2023_11_29_205307) do
  create_table "categoria", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalle_venta", force: :cascade do |t|
    t.text "numero_transaccion"
    t.integer "producto_id", null: false
    t.float "cantidad"
    t.float "precio"
    t.float "total_venta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_detalle_venta_on_producto_id"
  end

  create_table "privilegios", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.text "image_url"
    t.text "nombre"
    t.integer "categoria_id", null: false
    t.text "descripcion"
    t.float "precio"
    t.text "region"
    t.integer "cantidad_ventas"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria_id"], name: "index_productos_on_categoria_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "nombre_completo"
    t.string "correo"
    t.string "password_digest"
    t.string "telefono"
    t.integer "privilegio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["privilegio_id"], name: "index_users_on_privilegio_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "picture"
    t.integer "privilegio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["privilegio_id"], name: "index_usuarios_on_privilegio_id"
  end

  create_table "venta", force: :cascade do |t|
    t.text "numero_transaccion"
    t.integer "usuario_id", null: false
    t.float "total_venta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_venta_on_usuario_id"
  end

  add_foreign_key "detalle_venta", "productos"
  add_foreign_key "productos", "categoria", column: "categoria_id"
  add_foreign_key "users", "privilegios"
  add_foreign_key "usuarios", "privilegios"
  add_foreign_key "venta", "usuarios"
end
