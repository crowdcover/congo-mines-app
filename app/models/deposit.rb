class Deposit < ActiveRecord::Base
  belongs_to :drc_company
  #belongs_to :deposit_source

  has_many :proven_reserves, -> { where deposit_type:  DepositResource::PROVEN_RESERVES },
   as: :depoable, dependent: :destroy, class_name: 'DepositResource'

  has_many :probable_reserves, -> { where deposit_type: DepositResource::PROBABLE_RESERVES },
    as: :depoable, dependent: :destroy, class_name: 'DepositResource'

  has_many :total_reserves, -> { where deposit_type:  DepositResource::TOTAL_RESERVES },
     as: :depoable, dependent: :destroy, class_name: 'DepositResource'

  has_many :measured_resources, -> { where deposit_type: DepositResource::MEASURED_RESOURCES },
    as: :depoable, dependent: :destroy, class_name: 'DepositResource'

  has_many :indicated_resources,  -> { where deposit_type: DepositResource::INDICATED_RESOURCES },
    as: :depoable, dependent: :destroy, class_name: 'DepositResource'

  has_many :inferred_resources, -> { where deposit_type: DepositResource::INFERRED_RESOURCES },
    as: :depoable, dependent: :destroy, class_name: 'DepositResource'

  has_many :total_resources, -> { where deposit_type: DepositResource::TOTAL_RESOURCES },
   as: :depoable, dependent: :destroy, class_name: 'DepositResource'

  validates_presence_of :name, :lat, :lng
end
