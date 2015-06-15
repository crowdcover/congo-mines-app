class Admin::SourcesController  < Admin::Auth #ApplicationController
  active_scaffold :"source" do |config|
    config.columns = [:name, :description]
    config.list.per_page = 25
    config.list.sorting = { :name => :asc }
  end
end
