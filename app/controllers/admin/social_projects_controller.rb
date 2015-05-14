class Admin::SocialProjectsController <  Admin::Auth
  active_scaffold :"social_project" do |config|
      # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
  end
end
