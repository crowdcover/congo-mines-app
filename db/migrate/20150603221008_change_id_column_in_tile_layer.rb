class ChangeIdColumnInTileLayer < ActiveRecord::Migration
  def change
    change_column :tile_layers, :mapbox_tile_layer_id, :text
  end
end
