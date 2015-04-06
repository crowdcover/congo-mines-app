class ShareholderRelationship < ActiveRecord::Base
  belongs_to :multinational_company
  belongs_to :congolese_company
  belongs_to :shareholder
  
  
  #def to_label
  #  "#{shareholder.drc_company}"
  #end
end
