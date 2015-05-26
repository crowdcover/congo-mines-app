class Admin::SocialProjectsController <  Admin::Auth
  active_scaffold :"social_project" do |config|
  
    config.columns = [:project_type, :amount_planned, :amount_spent, :stage,
      :description, :lat, :lng]
      
    # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
  end
end
