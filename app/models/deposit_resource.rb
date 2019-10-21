# frozen_string_literal: true

class DepositResource < ActiveRecord::Base
  belongs_to :deposit_resourceable, polymorphic: true
  belongs_to :mineral_resource

  validates :mineral_resource, presence: true

  PROVEN_RESERVES     = 'proven_reserves'
  PROBABLE_RESERVES   = 'probable_reserves'
  TOTAL_RESERVES      = 'total_reserves'
  MEASURED_RESOURCES  = 'measured_resources'
  INDICATED_RESOURCES = 'indicated_resources'
  INFERRED_RESOURCES  = 'inferred_resources'
  TOTAL_RESOURCES     = 'total_resources'

  def to_label
    mineral_resource.try(:name)
  end
end
