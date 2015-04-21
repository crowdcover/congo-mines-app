class Admin::SourcesController  < Admin::Auth #ApplicationController
  active_scaffold :"source" do |conf|
  end
end
