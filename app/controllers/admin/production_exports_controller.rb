class Admin::ProductionExportsController < ApplicationController
  active_scaffold :"production_export" do |config|
  
  config.columns.exclude( :created_at, :updated_at)
  
  config.columns[:type_of_product].form_ui = :select
  config.columns[:type_of_product].options = {include_blank: 'Select Type of Product', options: ['copper concentrate','cobalt concentrate','concentrate copper - cobaltiferous','black copper','copper cathode','alloy white','alloy red','matte copper','zinc dust','dust lead','gross heterogeneity','hydroxide cobalt','gold gross','ingot gold', 'gross wolframite','coltan gross','gross cassiterite']}
  
  config.columns[:year].form_ui = :select
  config.columns[:year].options = {include_blank: 'Select Year', options: (1950..2014) }
  
  end
end
