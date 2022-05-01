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

ActiveRecord::Schema[7.0].define(version: 2022_05_01_234514) do
  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.date "data_de_nascimento"
    t.string "cpf"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.integer "cpf"
    t.string "email"
    t.string "cargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quartos", force: :cascade do |t|
    t.string "nome"
    t.integer "andar"
    t.float "diaria"
    t.integer "capacidade"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.integer "quarto_id", null: false
    t.integer "cliente_id", null: false
    t.date "check_in"
    t.date "checkout"
    t.integer "numero_adultos"
    t.integer "numero_criancas"
    t.text "pedidos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_reservas_on_cliente_id"
    t.index ["quarto_id"], name: "index_reservas_on_quarto_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "funcao", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "reservas", "clientes"
  add_foreign_key "reservas", "quartos"
end
