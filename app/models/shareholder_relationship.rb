class ShareholderRelationship < ActiveRecord::Base
  belongs_to :drc_company
  belongs_to :shareholder
  
  
  #def to_label
  #  "#{shareholder.drc_company}"
  #end
end
