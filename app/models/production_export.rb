# frozen_string_literal: true

class ProductionExport < ActiveRecord::Base
  belongs_to :drc_company
  belongs_to :source

  # validates_presence_of :year

  def to_label
    try(:type_of_product)
  end
end
