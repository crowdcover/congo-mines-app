class EnvAndSocialObligation < ActiveRecord::Base
  belongs_to :drc_company
  #validates_presence_of :year
  #validates :amount_Ivested_in, numericality: true
  
  def to_label
    year
  end
end
