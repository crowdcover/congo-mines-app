class EnvAndSocialObligation < ActiveRecord::Base
  belongs_to :congolese_company
  validates_presence_of :year
  
  validates :amount_Ivested_in, numericality: true
  
  def to_label
    year
  end
end
