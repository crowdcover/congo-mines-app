class Admin::DepositResourcesController < Admin::Auth
  active_scaffold :"deposit_resource" do |config|
  end
end
