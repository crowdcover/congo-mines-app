class MultinationalCompany < ActiveRecord::Base

  validates_presence_of :name
    
  has_many :shareholder_relationships  
  has_many :congolese_companies, through: :shareholder_relationships    #, source: :congolese_company 
  has_many :shareholders, through: :shareholder_relationships #, source: :multinational_company  
  has_and_belongs_to_many :stock_exchange_countries
  has_and_belongs_to_many :stock_exchanges
  #has_and_belongs_to_many :congolese_companies
  
 
  def to_label
    name
  end 
end
