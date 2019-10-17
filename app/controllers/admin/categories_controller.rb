class Admin::CategoriesController < Admin::Auth #< ApplicationController

  active_scaffold :"category" do |config|
    
    config.columns = [:name]
    config.list.columns = [:name, :reports] 
    config.nested.add_scoped_link(:children)  #nested link to children
    
    #config.columns[:name].description = "Enter the users first and last name"
  end
 

  protected 

  # If nested let active_scaffold manage everything
  # if not just show all root nodes
  def beginning_of_chain 
    nested? ? super : active_scaffold_config.model.roots 
  end 

  # Assign parent node to just created node
  def after_create_save(record) 
    if (nested? && nested.scope) 
      parent = nested_parent_record(:read) 
      record.send("#{nested.scope}").send(:<<, parent) unless parent.nil? 
    end
  end 
  

end
