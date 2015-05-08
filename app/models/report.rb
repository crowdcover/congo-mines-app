class Report < ActiveRecord::Base
  belongs_to :author
  belongs_to :source
  has_many :attachments, as: :attachable


  #validates_presence_of :title, :post_date, :summary
  #acts_as_taggable_on :skills, :interests

  has_many :report_categories
  has_many :categories, through: :report_categories

  has_many :report_relations
  has_many :drc_companies, through: :report_relations

  paginates_per 10

  searchable do
    text :title, :organization, :summary

    # this may need to be time, not date
    date :actual_post_date

    # need to make categories facets
    # text :categories do
    #   categories.map(&:name)
    # end
    # how about using pluck? categories.pluck(:id, :name)
    text :categories do
      categories.map { |category| [category.name, category.id] }
    end

    # pulling source
    text :source do
      source.try(:name)
    end
  end
end
