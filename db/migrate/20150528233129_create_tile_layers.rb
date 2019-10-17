class CreateTileLayers < ActiveRecord::Migration
  def change
    create_table :tile_layers do |t|
      t.string :label
      t.integer :mapbox_tile_layer_id

      t.timestamps null: false
    end
  end
end
