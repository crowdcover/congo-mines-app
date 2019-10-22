# frozen_string_literal: true

class Source < ActiveRecord::Base
  has_many :reports, dependent: :restrict_with_exception
  has_many :social_projects, dependent: :restrict_with_exception
  has_many :employees, dependent: :restrict_with_exception
  has_many :tax_obligations, dependent: :restrict_with_exception
  has_many :processing_infrastructures, dependent: :restrict_with_exception
  has_many :env_and_social_obligations, dependent: :restrict_with_exception
  has_many :shareholder_relationships, dependent: :restrict_with_exception
  has_many :shareholders, dependent: :restrict_with_exception
  has_many :flows_payable_under_contracts, dependent: :restrict_with_exception
  has_many :production_exports, dependent: :restrict_with_exception
end
