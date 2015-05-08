class Admin::ReportsController  < Admin::Auth # ApplicationController
  active_scaffold :"report" do |config|
 
 
    config.list.per_page = 25 
    config.create.multipart = 'local' 
    config.update.multipart = 'local' 
    
    config.list.sorting = { :actual_post_date => :desc }   
    config.columns = [:title, :recommended, :summary, :source, :actual_post_date]
 
    config.columns[:actual_post_date].label = 'Publication Date' 
    config.columns[:actual_post_date].form_ui = :date_picker
    config.columns[:actual_post_date].options = {options: [[changeYear: true]]}
    
    #config.columns[:author].form_ui = :select
    #config.columns[:source].form_ui = :select
    
    config.columns[:categories].form_ui = :chosen
    
  end
end
