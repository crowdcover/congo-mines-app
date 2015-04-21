class Admin::ShareholderRelationshipsController  < Admin::Auth # ApplicationController
  active_scaffold :"shareholder_relationship" do |config|
  end
end
