# frozen_string_literal: true

class SpecialReport < ActiveRecord::Base
  def label
    try(:title)
  end

  def title_url
    title.split.join('_')
  end

  def to_param
    "#{id}-#{title.try(:parameterize)}" if id
  end
end
