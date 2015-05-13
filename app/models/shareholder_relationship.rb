class ShareholderRelationship < ActiveRecord::Base
  belongs_to :drc_company
  belongs_to :shareholder
  
  
  def to_label
   drc_company.try(:name)
  end
end
