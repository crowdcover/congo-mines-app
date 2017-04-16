class Admin::DrcCompaniesController  < Admin::Auth # ApplicationController


  active_scaffold :"drc_company" do |config|

    config.label = I18n.t 'controllers.admin.drccompanies.label'

    # Export
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"

    config.columns = [:name, :description, :acronym,  :nrc, :rccm,:contact, :website,
        :legal_status, :project_type, :project_phase, :legal_regime, :permits,
        :flows_payable_under_contract, :tax_obligations,  :production_exports,
         :shareholder_relationships, :employees,
        :env_and_social_obligation, :processing_infrastructures, :social_projects]

    # you can define a default values for the exporting form
    #config.export.default_deselected_columns = %w(phone address)

    config.list.per_page = 25
    config.list.sorting = { :name => :asc }

    config.list.columns = [:name, :acronym,  :nrc, :rccm,:contact, :website,
      :legal_status, :project_type, :project_phase, :legal_regime, :permits, :deposits]

=begin
    config.update.columns = [:name, :description, :acronym,  :nrc, :rccm,:contact, :website,
      :legal_status, :project_type, :project_phase, :legal_regime, :permits,
      :flows_payable_under_contract, :tax_obligations,  :production_exports,
      :shareholder_relationships, :employees,
      :env_and_social_obligation, :processing_infrastructures, :social_projects]

    config.export.columns = [:name, :acronym, :description, :nrc, :rccm,:contact, :website,
        :legal_status, :project_type, :project_phase, :legal_regime, :permits,
        :flows_payable_under_contract, :tax_obligations,  :production_exports,
        :shareholder_relationships, :employees,
        :env_and_social_obligation, :deposits, :processing_infrastructures, :social_projects]
=end

    config.columns[:permits].form_ui = :textarea



    config.columns[:shareholder_relationships].allow_add_existing = false
    config.columns[:social_projects].allow_add_existing = false



    config.nested.add_link(:reports, label: 'Documents')
    config.nested.add_link(:deposits, label: 'Gisements')

    #config.columns[:tax_obligations].label = 'Tax Payments'

    config.columns[:legal_regime].form_ui = :select
    config.columns[:legal_regime].options = {
      include_blank: 'Sélectionnez Statut juridique',
      options: ['Convention',
                'Mining Code 2002',
                'Revised Mining Code']}

    config.columns[:legal_status].form_ui = :select
    config.columns[:legal_status].options = {
      include_blank: 'Sélectionnez Statut juridique',
      options: %w{SPRL SARL}}

    config.columns[:project_type].form_ui = :select
    config.columns[:project_type].options = {
      include_blank: 'Sélectionnez le type de projet',
      options: ['Industriel', 'Semi-industriel',
         'Artisanal'] }

    config.columns[:project_phase].form_ui = :select
    config.columns[:project_phase].options = {
      include_blank: 'Sélectionnez la phase de projet',
      options: %w{dormant exploration construction exploitation fermé} }
  end
end
