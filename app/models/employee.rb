# frozen_string_literal: true

class Employee < ActiveRecord::Base
  belongs_to :drc_company
end
