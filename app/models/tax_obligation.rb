# frozen_string_literal: true

class TaxObligation < ActiveRecord::Base
  belongs_to :drc_company
  belongs_to :source
  # validates_presence_of :year

  # #def to_label
  #  year
  # end
end
