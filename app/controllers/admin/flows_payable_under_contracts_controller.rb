class Admin::FlowsPayableUnderContractsController  < Admin::Auth # ApplicationController
  active_scaffold :"flows_payable_under_contract" do |config|
    config.columns = [:signature_bonus,:royalties, :annuity,
      :transfer_of_shares, :contract_cash_recipient]
     
    config.columns[:contract_cash_recipient].form_ui = :select
    config.columns[:contract_cash_recipient].options = {
      include_blank: 'Select Contract Cash Recipient', 
      options: ['Gecamines', 'SODIMICO', 'SOKIMO', 'SIMCO', 'Other']}      
    



  
  end
end
