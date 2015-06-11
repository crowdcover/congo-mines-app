class Admin::TileLayersController  < Admin::Auth # ApplicationController

  active_scaffold :"tile_layer" do |config|
    config.label = 'Maps'
    config.columns.exclude(:created_at, :updated_at)
    config.columns = [:mapbox_tile_layer, :label]
    #config.columns[:year].form_ui = :select
    #config.columns[:year].options = {include_blank: 'Select Year', options: (2000..Time.now.year) }
    #config.columns.exclude(:company_name)


  end
end
