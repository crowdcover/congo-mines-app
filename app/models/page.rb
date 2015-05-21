class Page < ActiveRecord::Base

  has_many :page_categories
  has_many :categories, through: :page_categories
  
  
  has_attached_file :banner, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
end
