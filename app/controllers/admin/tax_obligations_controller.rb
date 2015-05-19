class Admin::TaxObligationsController  < Admin::Auth # ApplicationController

  active_scaffold :"tax_obligation" do |config|
    config.label = 'Tax Payments'
    config.columns[:year].form_ui = :select
    config.columns[:year].options = {include_blank: 'Select Year', options: (2000..Time.now.year) }
    config.columns.exclude(:company_name)
  end
end
