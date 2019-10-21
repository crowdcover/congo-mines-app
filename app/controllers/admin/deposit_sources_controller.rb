# frozen_string_literal: true

class Admin::DepositSourcesController < Admin::Auth
  active_scaffold :deposit_source do |config|
    config.columns.exclude(:created_at, :updated_at)
  end
end
