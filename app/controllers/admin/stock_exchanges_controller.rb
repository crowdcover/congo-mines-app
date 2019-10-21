# frozen_string_literal: true

class Admin::StockExchangesController < Admin::Auth
  active_scaffold :stock_exchange do |conf|
  end
end
