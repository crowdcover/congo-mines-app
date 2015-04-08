class Admin::CongoleseCompaniesController < ApplicationController
  active_scaffold :"congolese_company" do |config|
    
    config.label = 'Congolese/ DRC Companies'
    config.columns.exclude( :created_at, :updated_at, :shareholder_relationships)
   
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
