# frozen_string_literal: true

class EnvAndSocialObligation < ActiveRecord::Base
  belongs_to :drc_company
  # validates_presence_of :year
  # validates :amount_Ivested_in, numericality: true

  def to_label
    try(:enviro_impact_date)
  end
end
