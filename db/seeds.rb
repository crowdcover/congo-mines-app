# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

stock_exchange_countries = ['Canada', 'USA', 'Australia', 'China', 'South Africa', 'UK', 'other']

stock_exchange_countries.each do |c| 
  StockExchangeCountry.create(name: c)
end

stock_exchanges = [
  'Toronto Stock Exchange (TSX)',
  'Toronto Venture Exchange (TSX.V)',
  'New York Stock Exchange (NYSE)', 
  'London Stock Exchange (LSE)',
  'London AIM / Hong Kong', 
  'Stock Exchange (HK)',
  'Australia Stock Exchange (ASX)', 
  'Johannesburg Stock Exchange (JSE)',
  'Other']
  
stock_exchanges.each do |s| 
  StockExchange.create(name: s)
end
