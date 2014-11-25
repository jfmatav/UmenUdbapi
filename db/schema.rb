# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141125044411) do

  create_table "acompanamientos", force: true do |t|
    t.integer "dia"
    t.integer "semana"
    t.integer "soda_id"
    t.string  "acompanamiento"
    t.string  "guarnicion"
    t.string  "ensalada1"
    t.string  "ensalada2"
    t.string  "ensalada3"
    t.string  "ensalada4"
    t.string  "ensalada5"
    t.string  "ensalada6"
    t.string  "fruta1"
    t.string  "fruta2"
    t.string  "fresco1"
    t.string  "fresco2"
    t.string  "frescosinazucar"
  end

  create_table "comentarios", force: true do |t|
    t.integer  "usuario_id"
    t.integer  "plato_id"
    t.string   "comentario"
    t.integer  "puntos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platos", force: true do |t|
    t.integer  "soda_id"
    t.string   "nombre"
    t.integer  "precio"
    t.string   "categoria"
    t.string   "tipo"
    t.integer  "calificaciones"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semana"
    t.integer  "dia"
    t.float    "promedio"
  end

  create_table "snacks", force: true do |t|
    t.integer  "soda_id"
    t.string   "nombre"
    t.integer  "precio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sodas", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "long"
    t.float    "lat"
    t.string   "descripcion"
  end

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "usuarios", force: true do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
  end

end
