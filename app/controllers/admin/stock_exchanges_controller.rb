class Admin::StockExchangesController  < Admin::Auth #ApplicationController
  active_scaffold :"stock_exchange" do |conf|
  end
end
