class CreatePageIdsForPages < ActiveRecord::Migration
  def change
  
    Page.destroy_all
    
    pg_to_cats_ids = {    
      'Sicomines'               => ['Not sure about this one --made up!', 44],
      'EITI Compliance'         => ["Transparence des Industries Extractives", 48],
      'Mining Code'             => ["Revision du Code Minier", 46],
      'Government Asset Sales'  => ["Gestion des entreprises étatiques", 45],
      'Human Rights'            => ["Mines, communautés locales et droits humains", 36]
    }
    
    pg_to_cats_ids.each_key do |p|
      category_id = pg_to_cats_ids[p][1]
      pg = Page.find_or_create_by(topic: p, category_id: category_id) 
    end
  end
end
