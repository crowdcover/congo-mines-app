# frozen_string_literal: true

class ReportRelation < ActiveRecord::Base
  belongs_to :report
  belongs_to :drc_company
end
