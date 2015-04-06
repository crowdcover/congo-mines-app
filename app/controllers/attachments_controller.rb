class AttachmentsController < ApplicationController
  active_scaffold :"attachment" do |config|

    #config.columns.exclude(:asset_updated_at, :created_at, :updated_at, 
    # :asset_content_type, :asset_file_name, :asset_file_size) 
    
    config.columns = [:asset] 
    config.list.columns = [:asset]
    
    config.actions << :sortable
    config.sortable.column = :position
  end
end
