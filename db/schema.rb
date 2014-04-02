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

ActiveRecord::Schema.define(version: 20140402001002) do

  create_table "administradors", force: true do |t|
    t.string   "nome"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administradors", ["login"], name: "index_administradors_on_login", unique: true, using: :btree

  create_table "aplicacaos", force: true do |t|
    t.integer  "linguagem"
    t.integer  "tamanho_texto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campos", force: true do |t|
    t.string   "chave"
    t.string   "conteudo"
    t.integer  "traducao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campos", ["traducao_id"], name: "index_campos_on_traducao_id", using: :btree

  create_table "cronologia", force: true do |t|
    t.boolean  "modo_automatico"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aplicacao_id"
  end

  add_index "cronologia", ["aplicacao_id"], name: "index_cronologia_on_aplicacao_id", using: :btree

  create_table "eventos", force: true do |t|
    t.datetime "data"
    t.string   "local"
    t.boolean  "publicado"
    t.datetime "data_criacao"
    t.boolean  "visivel"
    t.integer  "cronologia_id"
    t.integer  "mapa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "eventos", ["cronologia_id"], name: "index_eventos_on_cronologia_id", using: :btree
  add_index "eventos", ["mapa_id"], name: "index_eventos_on_mapa_id", using: :btree

  create_table "mapas", force: true do |t|
    t.integer  "aplicacao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mapas", ["aplicacao_id"], name: "index_mapas_on_aplicacao_id", using: :btree

  create_table "puzzles", force: true do |t|
    t.string   "imagem"
    t.integer  "aplicacao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "puzzles", ["aplicacao_id"], name: "index_puzzles_on_aplicacao_id", using: :btree

  create_table "recursos", force: true do |t|
    t.integer  "linguagem"
    t.string   "filename"
    t.string   "conteudo"
    t.integer  "duracao"
    t.integer  "evento_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recursos", ["evento_id"], name: "index_recursos_on_evento_id", using: :btree

  create_table "traducaos", force: true do |t|
    t.string   "lingua"
    t.integer  "aplicacao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "traducaos", ["aplicacao_id"], name: "index_traducaos_on_aplicacao_id", using: :btree

  create_table "visitantes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
