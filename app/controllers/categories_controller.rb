class CategoriesController < ApplicationController
  active_scaffold :"category" do |config|
    config.columns = [:name, :children, :reports]  
  end
  
 
 # def conditions_for_collection
 #   ['parent_id is NULL']
 # end

end
