# frozen_string_literal: true

class Source < ActiveRecord::Base
  has_many :reports
end
