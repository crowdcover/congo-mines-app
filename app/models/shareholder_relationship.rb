# frozen_string_literal: true

class ShareholderRelationship < ActiveRecord::Base
  belongs_to :drc_company
  belongs_to :shareholder
  belongs_to :source

  has_many :shareholder_intermediaries, dependent: :destroy
  has_many :intermediary_companies, through: :shareholder_intermediaries

  # validates_presence_of :drc_company #, :shareholder #, :deposit_source

  def to_label
    if drc_company.present?
      drc_company.try(:name)
    else
      '-'
    end
  end
end
