class Category < ActiveRecord::Base
  acts_as_tree order: "position"
  acts_as_list
  
  has_many :report_categories
  has_many :reports, through: :report_categories

end 
