class Deposit < ActiveRecord::Base
  belongs_to :drc_company
  has_many :resources, class_name: 'DepositResource', dependent: :destroy
end
