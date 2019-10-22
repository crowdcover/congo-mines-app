# frozen_string_literal: true

class FlowsPayableUnderContract < ActiveRecord::Base
  belongs_to :drc_company
  belongs_to :source
end
