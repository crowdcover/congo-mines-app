class IntermediaryCompany < ActiveRecord::Base
  
  has_many :shareholder_intermediaries
  has_many :shareholder_relationships, through: :shareholder_intermediaries
  #has_many :shareholders, through: :shareholder_relationships
  
end
