class Admin::ShareholderRelationshipsController  < Admin::Auth # ApplicationController
  active_scaffold :"shareholder_relationship" do |config|
    
    config.columns.exclude(:drc_companies, :created_at, :updated_at)
  end
end
