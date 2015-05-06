class Admin::ReportsController  < Admin::Auth # ApplicationController
  active_scaffold :"report" do |config|
 
    config.create.multipart = 'local' 
    config.update.multipart = 'local'  
    #config.list.sorting = { :date => :asc }
    
    config.columns[:actual_post_date].form_ui = :date_picker
    config.columns[:actual_post_date].options = {options: [[changeYear: true]]}
    
    #config.columns[:author].form_ui = :select
    #config.columns[:source].form_ui = :select
    
    config.columns[:categories].form_ui = :chosen

    config.columns = [:source, :title, :actual_post_date,
      :summary, :categories, :attachments, :drc_companies, :cm_url]
  end
end
