class Admin::DrcCompaniesController  < Admin::Auth # ApplicationController
  
  
  active_scaffold :"drc_company" do |config|
    
    config.label = 'Congolese/ DRC Companies'
    
    # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
    config.export.columns = [:name, :acronym,  :nrc, :rccm,:contact, :website,
      :legal_status, :project_type, :project_phase, :legal_regime,
      :flows_payable_under_contract, :tax_obligations,  :production_exports, 
      :shareholder_relationships, :employees, 
      :env_and_social_obligations, :deposits, :processing_infrastructures, :social_projects]
    
    # you can define a default values for the exporting form
    #config.export.default_deselected_columns = %w(phone address)
    
    
    
    config.list.per_page = 25 
    config.list.sorting = { :name => :asc }   

    config.columns = [:name, :acronym,  :nrc, :rccm,:contact, :website,
      :legal_status, :project_type, :project_phase, :legal_regime]
    
    
    config.update.columns = [:name, :description, :acronym,  :nrc, :rccm,:contact, :website,
      :legal_status, :project_type, :project_phase, :legal_regime,
      :flows_payable_under_contract, :tax_obligations,  :production_exports, 
      :shareholder_relationships, :employees, 
      :env_and_social_obligations, :deposits, :processing_infrastructures, :social_projects]
    
    
    config.nested.add_link(:reports, label: 'Documents')

    config.columns[:tax_obligations].label = 'Tax Payments'
    
   
    config.columns[:legal_regime].form_ui = :select
    config.columns[:legal_regime].options = {
      include_blank: 'Select Legal Status',
      options: ['Convention',
                'Mining Code 2002',
                'Revised Mining Code']}
   
    config.columns[:legal_status].form_ui = :select
    config.columns[:legal_status].options = {
      include_blank: 'Select Legal Status',
      options: %w{SPRL SARL}}
    
    config.columns[:project_type].form_ui = :select
    config.columns[:project_type].options = {
      include_blank: 'Select Project Type',
      options: ['Industrial (industriel)', 'Semi-Industrial (semi-industriel)',
         'artisanal (artisanal)'] }
    
    config.columns[:project_phase].form_ui = :select
    config.columns[:project_phase].options = {
      include_blank: 'Select Project Phase',
      options: %w{dormant exploration construction exploitation closed} }
  end
end
