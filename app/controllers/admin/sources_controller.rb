# frozen_string_literal: true

class Admin::SourcesController < Admin::Auth
  active_scaffold :source do |config|
    config.columns = %i[name description]
    config.list.per_page = 25
    config.list.sorting = { name: :asc }
  end
end
