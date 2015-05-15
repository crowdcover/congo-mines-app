class Admin::TaxObligationsController  < Admin::Auth # ApplicationController
  active_scaffold :"tax_obligation" do |config|
    config.columns[:year].form_ui = :select
    config.columns[:year].options = {include_blank: 'Select Year', options: (1950..2014) }
    config.columns.exclude(:company_name)
    
   # Ibp 	Import customs duty 	Other 	Redevance 	Royalties 	Signature bonus 	Surface rights 	Total paid 	Year
    
    # flows_payable
    
  end
end
