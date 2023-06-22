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

ActiveRecord::Schema.define(version: 2023_06_21_024528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dscunidade", primary_key: "dscunidade", id: { type: :string, limit: 20 }, force: :cascade do |t|
  end

  create_table "empresas", primary_key: "cnpj", id: { type: :string, limit: 14 }, force: :cascade do |t|
    t.string "nome", limit: 50, null: false
    t.index ["nome"], name: "empresas_nome_key", unique: true
  end

  create_table "modalidade_tarifaria", primary_key: "idmodalidade_tarifaria", id: { type: :string, limit: 40 }, force: :cascade do |t|
  end

  create_table "subgrupos_tarifarios", primary_key: "idsubgrupos_tarifarios", id: { type: :string, limit: 15 }, force: :cascade do |t|
  end

  create_table "tarifa_aplicacao", primary_key: "tarifa_aplicacao_base", id: { type: :string, limit: 30 }, force: :cascade do |t|
  end

  create_table "tarifas", primary_key: "idtarifas", id: :serial, force: :cascade do |t|
    t.date "datgeracaoconjuntodados", null: false
    t.string "dscresolucaohomologatoria", limit: 255, null: false
    t.string "sigagente", limit: 50, null: false
    t.string "numcnpjdistribuidora", limit: 14, null: false
    t.date "datiniciovigencia", null: false
    t.date "datfimvigencia", null: false
    t.string "dscbasetarifa", limit: 30, null: false
    t.string "descsubgrupo", limit: 15, null: false
    t.string "dscmodalidadetarifaria", limit: 40, null: false
    t.string "dscclasse", limit: 20
    t.string "dscsubclasse", limit: 150
    t.string "dscdetalhe", limit: 40
    t.string "nompostotarifario", limit: 20
    t.string "descunidade", limit: 20, null: false
    t.string "sigagenteacessante", limit: 50
    t.string "vlrtusd", limit: 50, null: false
    t.string "vlrte", limit: 50, null: false
  end

  add_foreign_key "tarifas", "dscunidade", column: "descunidade", primary_key: "dscunidade", name: "fk_unidade", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tarifas", "empresas", column: "numcnpjdistribuidora", primary_key: "cnpj", name: "fk_numcnpjdistribuidora", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tarifas", "empresas", column: "sigagente", primary_key: "nome", name: "fk_sigagente", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tarifas", "modalidade_tarifaria", column: "dscmodalidadetarifaria", primary_key: "idmodalidade_tarifaria", name: "fk_modalidade", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tarifas", "subgrupos_tarifarios", column: "descsubgrupo", primary_key: "idsubgrupos_tarifarios", name: "fk_subgrupo", on_update: :cascade, on_delete: :cascade
  add_foreign_key "tarifas", "tarifa_aplicacao", column: "dscbasetarifa", primary_key: "tarifa_aplicacao_base", name: "fk_tarifa", on_update: :cascade, on_delete: :cascade
end
