class Category < ActiveRecord::Base
  acts_as_tree order: "position"
  acts_as_list
  #extend ActsAsTree::TreeView
  #extend ActsAsTree::TreeWalker


  has_one :page

  has_many :report_categories
  has_many :reports, through: :report_categories


  def to_param
   "#{id}-#{name.try(:parameterize)}"  if id
  end
end
