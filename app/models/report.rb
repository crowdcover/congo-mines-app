# frozen_string_literal: true

class Report < ActiveRecord::Base
  belongs_to :author
  belongs_to :source
  has_many :attachments, as: :attachable,  dependent: :destroy

  has_many :report_categories, dependent: :destroy
  has_many :categories, through: :report_categories

  has_many :report_relations, dependent: :destroy
  has_many :drc_companies, through: :report_relations
  # has_many :pages, through: :drc_companies

  validates :title, presence: true # , :summary #, :source # :source_id

  scope :published, -> { where(visibility: 'published') }
  scope :draft, -> { where(visibility: 'draft') }

  # Sunspot Index Below
  # paginates_per 10

  searchable do
    text :title, boost: 5
    text :summary, boost: 5
    text :organization, :summary, :date_string
    string :visibility

    boolean :recommended, using: :recommended?
    # boolean :draft, :using => :draft?

    date :actual_post_date

    # time reports do
    #  time :published_at
    # string :publish_month

    text :drc_companies do
      drc_companies.pluck(:name)
    end

    # text :source do
    #   source.name
    # end

    text :attachments do
      attachments.map { |a| a.asset.url }
    end

    text :categories do
      categories.pluck(:name)
    end

    integer :drc_company_ids, multiple: true, references: DrcCompany do
      drc_companies.map(&:id)
    end

    integer :category_ids, multiple: true, references: Category do
      categories.map(&:id)
    end

    # time :actual_post_date
    # string :actual_post_date_month
  end

  def to_param
    "#{id}-#{title.try(:parameterize)}"
  end

  #   searchable do
  #     text :title, :organization, :summary
  #
  #     # this may need to be time, not date
  #     date :actual_post_date
  #
  #     integer :category_ids, multiple: true, references: Category do
  #       categories.map { |category| category.id }
  #     end
  #
  #     # pulling source
  #     text :source do
  #       source.try(:name)
  #     end
  #
  #     integer :drc_company_ids, multiple: true, references: DrcCompany do
  #       drc_companies.map { |drc_company| drc_company.id }
  #     end
  #   end

  # def actual_post_date_month
  #    actual_post_date.strftime("%B %Y")
  #  end
end
