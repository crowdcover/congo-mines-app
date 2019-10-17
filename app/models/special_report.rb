class SpecialReport < ActiveRecord::Base

  def label
    try(:title)
  end

  def title_url
    self.title.split.join('_')
  end

  def to_param
    "#{id}-#{title.try(:parameterize)}"  if id
  end

end
