class Report < ActiveRecord::Base
  belongs_to :author
  belongs_to :source
  has_many :attachments, as: :attachable

  has_many :report_categories
  has_many :categories, through: :report_categories

  has_many :report_relations
  has_many :drc_companies, through: :report_relations

  validates_presence_of :title, :source, :summary
 
  paginates_per 10
  searchable do
    text :title, :organization, :summary

    # this may need to be time, not date
    date :actual_post_date

    integer :category_ids, multiple: true, references: Category do
      categories.map { |category| category.id }
    end

    # pulling source
    text :source do
      source.try(:name)
    end

    integer :drc_company_ids, multiple: true, references: DrcCompany do
      drc_companies.map { |drc_company| drc_company.id }
    end
  end
end
