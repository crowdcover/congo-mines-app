class ShareholdersController < ApplicationController
  active_scaffold :"shareholder" do |config|
  
    #config.columns[:congolese_companies].options = {:draggable_lists => true}
  
    config.columns.exclude(:shareholder_relationships, :created_at, :updated_at)
     
  
    config.columns[:congolese_companies].form_ui = :select
    config.columns[:multinational_companies].form_ui = :select
  
    
    config.columns[:year].form_ui = :select
    config.columns[:year].options = {include_blank: 'Select Year', options: (1950..2014) }
  
    config.columns[:partnership_with_the_portfolio_companies_of_the_state].form_ui = :select
    
    config.columns[:partnership_with_the_portfolio_companies_of_the_state].options = {
      include_blank: 'Select Partnership', 
      options: ['No partnership',
                'Title assigned to joint venture company in which state owned company is a shareholder',
                'Title transferred to a non-state-owned company',
                'Title rented out by a state owned company', 
                'Title option granted by a state owned company']}
                
                
    config.columns[:state].form_ui = :select           
    config.columns[:state].options = {
      include_blank: 'Select Partnership State', 
      options: ['No state participation','Congolese state', 'Gecamines', 'Sokimo',    
        'MIBA','Sakima','Sodimico','SCIM','Kisenge-Manganese','SIMCO','Cominiere']}


  end
end
