# frozen_string_literal: true

class Shareholder < ActiveRecord::Base
  # validates_presence_of :year, :partnership_with_the_portfolio_companies_of_the_state,
  #  :state, :drc_company
  belongs_to :source

  has_many :shareholder_relationships
  # has_many :shareholder_intermediaries, through: :shareholder_relationships
  has_many :drc_companies, through: :shareholder_relationships
  # has_many :shareholders, through: :shareholder_relationships

  validates :name, uniqueness: true, presence: true

  # has_many :multinational_companies, through: :shareholder_relationships

  # def to_label
  #  try(:drc_company)
  # end

  def to_param
    "#{id}-#{name.try(:parameterize)}" if id
  end
end
