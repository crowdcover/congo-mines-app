class UpdateProductNames < ActiveRecord::Migration
  def up
    execute "UPDATE production_exports SET type_of_product='Concentré de cuivre' where type_of_product ='copper concentrate'"
    execute "UPDATE production_exports SET type_of_product='Concentré de cobalt' where type_of_product ='cobalt concentrate'"
    execute "UPDATE production_exports SET type_of_product='Concentré cuivro-cobaltifère' where type_of_product ='concentrate copper - cobaltiferous'"
    execute "UPDATE production_exports SET type_of_product='Cuivre noire' where type_of_product ='black copper'"
    execute "UPDATE production_exports SET type_of_product='Cathode de cuivre' where type_of_product ='copper cathode'"
    execute "UPDATE production_exports SET type_of_product='Alliage blanc' where type_of_product ='alloy white'"
    execute "UPDATE production_exports SET type_of_product='Alliage rouge' where type_of_product ='alloy red'"
    execute "UPDATE production_exports SET type_of_product='Cuivre mat' where type_of_product ='matte copper'"
    execute "UPDATE production_exports SET type_of_product='Poussière de zinc' where type_of_product ='zinc dust'"
    execute "UPDATE production_exports SET type_of_product='Poussière de plomb' where type_of_product ='dust lead'"
    execute "UPDATE production_exports SET type_of_product='Hétérogénite brut' where type_of_product ='gross heterogeneity'"
    execute "UPDATE production_exports SET type_of_product='Hydroxyde de cobalt' where type_of_product ='hydroxide cobalt'"
    execute "UPDATE production_exports SET type_of_product='Or brut' where type_of_product ='gold gross'"
    execute "UPDATE production_exports SET type_of_product='Lingot or' where type_of_product ='ingot gold'"
    execute "UPDATE production_exports SET type_of_product='Wolframite brut' where type_of_product ='gross wolframite'"
    execute "UPDATE production_exports SET type_of_product='Coltan brut' where type_of_product ='coltan gross'"
    execute "UPDATE production_exports SET type_of_product='Cassiterite brute' where type_of_product ='gross cassiterite'" 
  end
end
