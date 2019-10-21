# frozen_string_literal: true

class ReportCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :report

  validates :category, uniqueness: { scope: :report } # message:
end
