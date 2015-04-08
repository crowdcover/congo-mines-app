class Admin::TaxObligationsController < ApplicationController
  active_scaffold :"tax_obligation" do |config|
    config.columns[:year].form_ui = :select
    config.columns[:year].options = {include_blank: 'Select Year', options: (1950..2014) }
  end
end
