# frozen_string_literal: true

class ProcessingInfrastructure < ActiveRecord::Base
  belongs_to :drc_company
  belongs_to :source

  validates :lat, numericality: { greater_than_or_equal_to: -90,
                                  less_than_or_equal_to: 90 } # ,presence: true

  validates :lng, numericality: { greater_than_or_equal_to: -180,
                                  less_than_or_equal_to: 180 } # ,presence: true
end
