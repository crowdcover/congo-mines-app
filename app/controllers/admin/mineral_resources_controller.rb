class Admin::MineralResourcesController <  Admin::Auth
  active_scaffold :"mineral_resource" do |config|
    config.columns = [:name] 
  end
end
