class DepositResource < ActiveRecord::Base
  belongs_to :deposit_resourceable, polymorphic: true
  belongs_to :mineral_resource

  validates_presence_of :mineral_resource

  PROVEN_RESERVES   = 'proven_reserves'
  PROBABLE_RESERVES = 'probable_reserves'
  PROVEN_PROABLE_RESERVES = 'proven_probable_reserves'
  MEASURED_RESOURCES = 'measured_resources'
  INDICATED_RESOURCES = 'indicated_resources'
  INFERRED_RESOURCES = 'inferred_resources'
  TOTAL_RESOURCES = 'total_resources'

  def to_label
    mineral_resource.try(:name)
  end
end
