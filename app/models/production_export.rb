class ProductionExport < ActiveRecord::Base
  belongs_to :drc_company
  
  #validates_presence_of :year
  
 # def to_label
 #   year
  #end
end
