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

ActiveRecord::Schema.define(version: 20150330111304) do

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

  create_table "congolese_companies", force: :cascade do |t|
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
    t.string   "production_year"
    t.string   "type_of_product"
    t.string   "tonnage"
    t.string   "grade_percent"
    t.string   "metal_content"
    t.string   "export_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "env_and_social_obligations", force: :cascade do |t|
    t.integer  "congolese_company_id"
    t.integer  "year"
    t.integer  "number_of_direct_employees_expats"
    t.integer  "number_of_direct_employees_congolese"
    t.integer  "number_of_subcontractors_expats"
    t.integer  "number_of_subcontractors_congolese"
    t.string   "establishment"
    t.boolean  "of_community_funds"
    t.string   "dates_of_public_consultation_as_part_of_the_env_impact"
    t.string   "study_dates"
    t.string   "link_to_environmental_impact_study"
    t.string   "link_to_sustainable_dev_plan_and_or_community_agreement"
    t.boolean  "existence_of_a_platform_for_community_dialogue"
    t.string   "amount_invested_in"
    t.integer  "social_programmes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "env_and_social_obligations", ["congolese_company_id"], name: "index_env_and_social_obligations_on_congolese_company_id"

  create_table "multinational_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.string   "contact"
    t.string   "website"
    t.string   "listed"
    t.string   "on"
    t.string   "stock"
    t.boolean  "market"
    t.string   "stock_information"
    t.string   "stock_symbol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multinational_companies_stock_exchange_countries", id: false, force: :cascade do |t|
    t.integer "multinational_company_id"
    t.integer "stock_exchange_country_id"
  end

  create_table "multinational_companies_stock_exchanges", id: false, force: :cascade do |t|
    t.integer "multinational_company_id"
    t.integer "stock_exchange_id"
  end

  create_table "production_exports", force: :cascade do |t|
    t.integer  "congolese_company_id"
    t.integer  "year"
    t.string   "type_of_product"
    t.string   "tonnage"
    t.integer  "grade"
    t.string   "metal_content"
    t.decimal  "export_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_exports", ["congolese_company_id"], name: "index_production_exports_on_congolese_company_id"

  create_table "report_categories", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "report_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "report_categories", ["category_id"], name: "index_report_categories_on_category_id"
  add_index "report_categories", ["report_id"], name: "index_report_categories_on_report_id"

  create_table "report_relations", force: :cascade do |t|
    t.integer "congolese_company_id"
    t.integer "report_id"
  end

  add_index "report_relations", ["congolese_company_id"], name: "index_report_relations_on_congolese_company_id"
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
    t.integer  "multinational_company_id"
    t.integer  "congolese_company_id"
    t.integer  "shareholder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shareholder_relationships", ["congolese_company_id"], name: "index_shareholder_relationships_on_congolese_company_id"
  add_index "shareholder_relationships", ["multinational_company_id"], name: "index_shareholder_relationships_on_multinational_company_id"
  add_index "shareholder_relationships", ["shareholder_id"], name: "index_shareholder_relationships_on_shareholder_id"

  create_table "shareholders", force: :cascade do |t|
    t.string   "drc_company"
    t.string   "partnership_with_the_portfolio_companies_of_the_state"
    t.string   "state"
    t.string   "private_direct"
    t.string   "private_indirect"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.integer  "congolese_company_id"
    t.integer  "signature_bonus_payable"
    t.string   "formula_of"
    t.string   "royalties_payable"
    t.string   "formula_of_annuity_or_rent_to_pay"
    t.integer  "amount_for_transfer_of_shares"
    t.string   "recipient_of_the_contractual_cash_flows"
    t.integer  "year"
    t.integer  "total_amount_paid_according_to_company_EITI_declaration"
    t.integer  "royalties"
    t.integer  "declared_IBP"
    t.integer  "declared_customs_duty_on_imports"
    t.integer  "surface_rights_declared"
    t.integer  "signature_bonus_declared"
    t.integer  "declared_royalties"
    t.string   "other_contractual_flows_reported"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tax_obligations", ["congolese_company_id"], name: "index_tax_obligations_on_congolese_company_id"

end
