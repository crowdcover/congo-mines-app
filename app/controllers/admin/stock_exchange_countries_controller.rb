class Admin::StockExchangeCountriesController  < Admin::Auth # ApplicationController
  active_scaffold :"stock_exchange_country" do |conf|
  end
end
