class Admin::ProcessingInfrastructuresController <  Admin::Auth
  active_scaffold :"processing_infrastructure" do |config|
    # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
  end
end
