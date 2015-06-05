class DrcCompany < ActiveRecord::Base

  has_many :production_exports, dependent: :destroy
  has_many :tax_obligations, dependent: :destroy

  has_many :shareholder_relationships, dependent: :destroy
  has_many :shareholders, through: :shareholder_relationships

  has_many :report_relations, dependent: :destroy
  has_many :reports, through: :report_relations, dependent: :destroy

  has_many :social_projects, dependent: :destroy

  has_many :processing_infrastructures, dependent: :destroy
  has_many :deposits, dependent: :destroy

  has_many :employees, dependent: :destroy

  has_one :flows_payable_under_contract, dependent: :destroy
  has_one :env_and_social_obligation, dependent: :destroy

  has_one :page

  validates_presence_of :name #, :legal_status, :project_phase, :project_type, :acronym, :contact

  paginates_per 30

  def to_label
    try(:name)
  end

  searchable do
    text :name, :boost => 5

    text :description, :acronym, :nrc, :rccm, :contact, :website, :legal_status,
      :legal_status, :project_type, :project_phase, :legal_regime, :permits

    #time reports do
    #  time :published_at
    #string :publish_month
    text :reports do
      reports.pluck(:summary)
    end

      #time :published_at
      #string :publish_month

  end

  #def drc_company_name_url
  # self.name.split.join('_')
  #end

  #def to_param
  #  "#{id}_#{drc_company_name_url}"
  #end

end
