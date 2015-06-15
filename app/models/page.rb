class Page < ActiveRecord::Base
  acts_as_list

  has_many :page_categories
  has_many :categories, through: :page_categories

  belongs_to :category
  has_many :reports, through: :category

  belongs_to :drc_company

  validates_uniqueness_of :topic, if: :topic_changed?

  DEFAULT_URL = "#{Rails.configuration.action_controller.asset_host}#{Rails.configuration.assets.prefix}/default_topic_img.jpg"
  has_attached_file :banner,
    styles: { :medium => "300x300>", :thumb => "100x100>" },
    default_url: DEFAULT_URL
    #default_url: ActionController::Base.helpers.asset_path('default_topic_img.jpg')
    #:default_url => "/assets/default_topic_img.jpg"
    # default_url: ->(attachment) { 'default_topic_img.jpg' }

  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  def label
    try(:topic)
  end

  def topic_url
    self.topic.split.join('_')
  end

  #def to_param
#    "#{id}_#{topic_url}"
  #end

  def to_param
    "#{id}-#{topic.parameterize}"
  end

end
