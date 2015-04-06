class TaxObligation < ActiveRecord::Base
  belongs_to :congolese_company
  validates_presence_of :year
  
  def to_label
    year
  end
end
