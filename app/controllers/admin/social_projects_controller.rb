class Admin::SocialProjectsController <  Admin::Auth
  active_scaffold :"social_project" do |config|
  
    config.columns = [:drc_company, :project_type, :year, :amount_planned,
     :amount_spent, :stage, :description, :lat, :lng]
      
    config.columns[:year].form_ui = :select
    config.columns[:year].options = {
      include_blank: 'Select Year', 
      options: (2000..Time.now.year) }  
      
    # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
  end
end
