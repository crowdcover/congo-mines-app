class Admin::DepositResourcesController < Admin::Auth
  active_scaffold :"deposit_resource" do |config|
  
    config.columns.exclude(:created_at, :updated_at)
       
    config.columns[:measurement].form_ui = :select
    config.columns[:measurement].options = {
      include_blank: 'Select Measurement',
      options: ['proven reserves', 'probable reserves', 'proven probable reserves',
      'measured_resources','indicated_resources','inferred_resources', 'total_resources'] }

    config.columns[:resource].form_ui = :select
    config.columns[:resource].options = {
      include_blank: 'Select Resource', 
      options: ['gold', 'copper', 'cobalt', 'zinc', 'silver', 'tin']}
   
   
    config.columns[:metal_content_unit].form_ui = :select
    config.columns[:metal_content_unit].options = {
      options:   ['Kt', 'Moz']}
      
    #config.columns[:metal_content_unit].form_ui = :chosen  
    #config.columns[:resource].form_ui = :chosen
    #config.columns[:measurement].form_ui = :chosen  
  end
end
