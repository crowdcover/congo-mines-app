class DrcCompany < ActiveRecord::Base

  has_many :production_exports
  has_many :tax_obligations
  has_many :env_and_social_obligations

  has_many :shareholder_relationships
  has_many :shareholders, through: :shareholder_relationships

  has_many :report_relations
  has_many :reports, through: :report_relations

  has_many :social_projects
  has_many :processing_infrastructures
  has_many :deposits

  has_many :employees

  validates_presence_of :name #, :legal_status, :project_phase, :project_type, :acronym, :contact


end
