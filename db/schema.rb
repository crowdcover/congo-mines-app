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

ActiveRecord::Schema.define(version: 20150413153314) do

  create_table "attachments", force: :cascade do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.string   "name"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "position"
    t.string   "name"
    t.string   "aasm_state"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drc_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.string   "nrc"
    t.string   "rccm"
    t.string   "contact"
    t.string   "website"
    t.string   "legal_status"
    t.string   "project_type"
    t.string   "project_phase"
    t.string   "legal_regime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.integer  "year"
    t.integer  "direct_expat"
    t.integer  "direct_congolese"
    t.integer  "subcontractor_expat"
    t.integer  "subcontractor_congolese"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "employees", ["drc_company_id"], name: "index_employees_on_drc_company_id"

  create_table "env_and_social_obligations", force: :cascade do |t|
    t.integer "drc_company_id"
    t.boolean "community_fund"
    t.date    "enviro_impact_date"
    t.string  "enviro_impact_link"
    t.string  "sustainable_dev_plan"
    t.boolean "community_dialogue_platform"
    t.integer "social_investment"
  end

  add_index "env_and_social_obligations", ["drc_company_id"], name: "index_env_and_social_obligations_on_drc_company_id"

  create_table "flows_payable_under_contracts", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.integer  "signature_bonus"
    t.integer  "royalties"
    t.integer  "annuity"
    t.integer  "transfer_of_shares"
    t.string   "contract_cash_recipient"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "flows_payable_under_contracts", ["drc_company_id"], name: "index_flows_payable_under_contracts_on_drc_company_id"

  create_table "multinational_companies_stock_exchange_countries", id: false, force: :cascade do |t|
    t.integer "multinational_company_id"
    t.integer "stock_exchange_country_id"
  end

  create_table "multinational_companies_stock_exchanges", id: false, force: :cascade do |t|
    t.integer "multinational_company_id"
    t.integer "stock_exchange_id"
  end

  create_table "production_exports", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.integer  "year"
    t.string   "type_of_product"
    t.string   "tonnage"
    t.integer  "grade"
    t.string   "metal_content"
    t.decimal  "export_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_exports", ["drc_company_id"], name: "index_production_exports_on_drc_company_id"

  create_table "report_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "report_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "report_categories", ["category_id"], name: "index_report_categories_on_category_id"
  add_index "report_categories", ["report_id"], name: "index_report_categories_on_report_id"

  create_table "report_relations", force: :cascade do |t|
    t.integer "drc_company_id"
    t.integer "report_id"
  end

  add_index "report_relations", ["drc_company_id"], name: "index_report_relations_on_drc_company_id"
  add_index "report_relations", ["report_id"], name: "index_report_relations_on_report_id"

  create_table "reports", force: :cascade do |t|
    t.string   "title"
    t.string   "organization"
    t.text     "summary"
    t.date     "post_date"
    t.string   "date_string"
    t.string   "cm_url"
    t.integer  "author_id"
    t.integer  "source_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reports", ["author_id"], name: "index_reports_on_author_id"
  add_index "reports", ["source_id"], name: "index_reports_on_source_id"

  create_table "shareholder_relationships", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.integer  "shareholder_id"
    t.integer  "percentage"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shareholder_relationships", ["drc_company_id"], name: "index_shareholder_relationships_on_drc_company_id"
  add_index "shareholder_relationships", ["shareholder_id"], name: "index_shareholder_relationships_on_shareholder_id"

  create_table "shareholders", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.string   "name"
    t.string   "acronym"
    t.string   "contact"
    t.string   "website"
    t.boolean  "stock"
    t.string   "public_private"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shareholders", ["drc_company_id"], name: "index_shareholders_on_drc_company_id"

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_exchange_countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_exchanges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "tax_obligations", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.integer  "year"
    t.string   "company_name"
    t.integer  "total_paid"
    t.integer  "redevance"
    t.integer  "ibp"
    t.boolean  "import_customs_duty"
    t.integer  "surface_rights"
    t.integer  "signature_bonus"
    t.integer  "royalties"
    t.integer  "other"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tax_obligations", ["drc_company_id"], name: "index_tax_obligations_on_drc_company_id"

end
