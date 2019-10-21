# frozen_string_literal: true

class Admin::IntermediaryCompaniesController < Admin::Auth
  active_scaffold :intermediary_company do |config|
    config.columns = [:name]
  end
end
