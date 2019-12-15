# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_10_001230) do

  create_table "cabeceras", force: :cascade do |t|
    t.string "tipo_de_registro"
    t.string "id_pago"
    t.string "moneda"
    t.string "monto_total"
    t.string "total_con_descuentos"
    t.integer "cliente_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_cabeceras_on_cliente_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "email"
    t.string "firstname"
    t.string "lastname"
    t.string "codigo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "descuentos", force: :cascade do |t|
    t.string "tipo_de_registro"
    t.string "id_descuento"
    t.string "monto"
    t.string "tipo"
    t.integer "cliente_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_descuentos_on_cliente_id"
  end

  create_table "footers", force: :cascade do |t|
    t.string "tipo_de_registro"
    t.string "fecha_de_pago"
    t.integer "cliente_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_footers_on_cliente_id"
  end

  create_table "transaccions", force: :cascade do |t|
    t.string "tipo_de_registro"
    t.string "id_transaccion"
    t.string "monto"
    t.string "tipo"
    t.integer "cliente_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_transaccions_on_cliente_id"
  end

end
