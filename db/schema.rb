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

ActiveRecord::Schema.define(version: 20191018032537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_index "attachments", ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id", using: :btree

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

  create_table "deposit_resources", force: :cascade do |t|
    t.string   "measurement"
    t.float    "grade"
    t.string   "metal_content_unit"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "deposit_type"
    t.integer  "depoable_id"
    t.string   "depoable_type"
    t.integer  "mineral_resource_id"
    t.float    "metal_content"
    t.float    "tonnage"
  end

  add_index "deposit_resources", ["depoable_type", "depoable_id"], name: "index_deposit_resources_on_depoable_type_and_depoable_id", using: :btree

  create_table "deposit_sources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.string   "name"
    t.integer  "drc_company_id"
    t.string   "mine_type"
    t.string   "permit_type"
    t.string   "permit_number"
    t.decimal  "lat",               precision: 15, scale: 10
    t.decimal  "lng",               precision: 15, scale: 10
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "deposit_source_id"
    t.string   "source"
  end

  add_index "deposits", ["drc_company_id"], name: "index_deposits_on_drc_company_id", using: :btree

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
    t.text     "description"
    t.text     "permits"
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.integer  "year"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "count"
    t.string   "contract_type"
    t.string   "nationality"
    t.string   "gender"
  end

  add_index "employees", ["drc_company_id"], name: "index_employees_on_drc_company_id", using: :btree

  create_table "env_and_social_obligations", force: :cascade do |t|
    t.integer "drc_company_id"
    t.date    "enviro_impact_date"
    t.string  "enviro_impact_link"
    t.string  "sustainable_dev_plan"
    t.float   "social_investment"
    t.string  "community_fund"
    t.string  "community_dialogue_platform"
  end

  add_index "env_and_social_obligations", ["drc_company_id"], name: "index_env_and_social_obligations_on_drc_company_id", using: :btree

  create_table "flows_payable_under_contracts", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.float    "signature_bonus"
    t.float    "royalties"
    t.float    "annuity"
    t.float    "transfer_of_shares"
    t.string   "contract_cash_recipient"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "flows_payable_under_contracts", ["drc_company_id"], name: "index_flows_payable_under_contracts_on_drc_company_id", using: :btree

  create_table "intermediary_companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "shareholder_relationship_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "mineral_resources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "multinational_companies_stock_exchange_countries", id: false, force: :cascade do |t|
    t.integer "multinational_company_id"
    t.integer "stock_exchange_country_id"
  end

  create_table "multinational_companies_stock_exchanges", id: false, force: :cascade do |t|
    t.integer "multinational_company_id"
    t.integer "stock_exchange_id"
  end

  create_table "page_categories", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "page_categories", ["category_id"], name: "index_page_categories_on_category_id", using: :btree
  add_index "page_categories", ["page_id"], name: "index_page_categories_on_page_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "topic"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.integer  "category_id"
    t.integer  "drc_company_id"
    t.integer  "position"
  end

  add_index "pages", ["category_id"], name: "index_pages_on_category_id", using: :btree
  add_index "pages", ["drc_company_id"], name: "index_pages_on_drc_company_id", using: :btree

  create_table "processing_infrastructures", force: :cascade do |t|
    t.string   "name"
    t.integer  "drc_company_id"
    t.decimal  "lat",            precision: 15, scale: 10
    t.decimal  "lng",            precision: 15, scale: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "processing_infrastructures", ["drc_company_id"], name: "index_processing_infrastructures_on_drc_company_id", using: :btree

  create_table "production_exports", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.integer  "year"
    t.string   "type_of_product"
    t.string   "tonnage"
    t.float    "grade"
    t.string   "metal_content"
    t.decimal  "export_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_exports", ["drc_company_id"], name: "index_production_exports_on_drc_company_id", using: :btree

  create_table "report_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "report_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "report_categories", ["category_id"], name: "index_report_categories_on_category_id", using: :btree
  add_index "report_categories", ["report_id"], name: "index_report_categories_on_report_id", using: :btree

  create_table "report_relations", force: :cascade do |t|
    t.integer "drc_company_id"
    t.integer "report_id"
  end

  add_index "report_relations", ["drc_company_id"], name: "index_report_relations_on_drc_company_id", using: :btree
  add_index "report_relations", ["report_id"], name: "index_report_relations_on_report_id", using: :btree

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
    t.date     "actual_post_date"
    t.boolean  "recommended"
    t.boolean  "draft",            default: false
    t.string   "visibility"
  end

  add_index "reports", ["author_id"], name: "index_reports_on_author_id", using: :btree
  add_index "reports", ["source_id"], name: "index_reports_on_source_id", using: :btree

  create_table "shareholder_intermediaries", force: :cascade do |t|
    t.integer  "shareholder_relationship_id"
    t.integer  "intermediary_company_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "shareholder_relationships", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.integer  "shareholder_id"
    t.float    "percentage"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "direct_shareholder"
  end

  add_index "shareholder_relationships", ["drc_company_id"], name: "index_shareholder_relationships_on_drc_company_id", using: :btree
  add_index "shareholder_relationships", ["shareholder_id"], name: "index_shareholder_relationships_on_shareholder_id", using: :btree

  create_table "shareholders", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.string   "name"
    t.string   "acronym"
    t.string   "contact"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stock_countries"
    t.string   "stock_exchange"
    t.string   "stock_symbol"
    t.string   "stock"
    t.string   "public_private"
  end

  add_index "shareholders", ["drc_company_id"], name: "index_shareholders_on_drc_company_id", using: :btree

  create_table "social_projects", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.string   "company"
    t.string   "project_type"
    t.float    "amount_planned"
    t.float    "amount_spent"
    t.string   "stage"
    t.text     "description"
    t.decimal  "lat",            precision: 15, scale: 10
    t.decimal  "lng",            precision: 15, scale: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "year"
  end

  add_index "social_projects", ["drc_company_id"], name: "index_social_projects_on_drc_company_id", using: :btree

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "special_reports", force: :cascade do |t|
    t.string "title"
    t.text   "content"
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

  add_index "taggings", ["context"], name: "index_taggings_on_context", using: :btree
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "tax_obligations", force: :cascade do |t|
    t.integer  "drc_company_id"
    t.integer  "year"
    t.string   "company_name"
    t.float    "total_paid"
    t.float    "redevance"
    t.float    "ibp"
    t.float    "surface_rights"
    t.float    "signature_bonus"
    t.float    "royalties"
    t.float    "other"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "import_customs_duty"
  end

  add_index "tax_obligations", ["drc_company_id"], name: "index_tax_obligations_on_drc_company_id", using: :btree

  create_table "tile_layers", force: :cascade do |t|
    t.string   "label"
    t.string   "mapbox_tile_layer"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_foreign_key "deposits", "drc_companies"
  add_foreign_key "employees", "drc_companies"
  add_foreign_key "flows_payable_under_contracts", "drc_companies"
  add_foreign_key "page_categories", "categories"
  add_foreign_key "page_categories", "pages"
  add_foreign_key "processing_infrastructures", "drc_companies"
  add_foreign_key "report_categories", "categories"
  add_foreign_key "report_categories", "reports"
  add_foreign_key "shareholder_intermediaries", "intermediary_companies"
  add_foreign_key "shareholder_intermediaries", "shareholder_relationships"
  add_foreign_key "social_projects", "drc_companies"
end
