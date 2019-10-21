# frozen_string_literal: true

class Admin::StockExchangeCountriesController < Admin::Auth
  active_scaffold :stock_exchange_country do |conf|
  end
end
