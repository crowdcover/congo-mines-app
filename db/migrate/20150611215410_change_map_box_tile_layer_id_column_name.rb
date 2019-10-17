class ChangeMapBoxTileLayerIdColumnName < ActiveRecord::Migration
  def change
    rename_column :tile_layers, :mapbox_tile_layer_id, :mapbox_tile_layer
  end
end
