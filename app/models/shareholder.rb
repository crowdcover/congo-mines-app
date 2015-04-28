class Shareholder < ActiveRecord::Base
  #validates_presence_of :year, :partnership_with_the_portfolio_companies_of_the_state,
  #  :state, :drc_company
    
  has_many :shareholder_relationships
  has_many :drc_companies, through: :shareholder_relationships   
  #has_many :multinational_companies, through: :shareholder_relationships
  
  #def to_label
  #  drc_company   
  # end   
end
