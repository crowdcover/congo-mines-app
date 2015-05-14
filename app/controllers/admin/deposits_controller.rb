class Admin::DepositsController <  Admin::Auth
  active_scaffold :"deposit" do |config|
      # Export    
    config.actions.add :export
    config.export.force_quotes = "true"
    config.export.force_quotes = "true"
  end
end
