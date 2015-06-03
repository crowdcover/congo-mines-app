class Admin::SourcesController  < Admin::Auth #ApplicationController
  active_scaffold :"source" do |config|
    config.columns = [:name, :description]
  end
end
