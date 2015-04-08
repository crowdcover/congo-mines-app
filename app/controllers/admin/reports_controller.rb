class Admin::ReportsController < ApplicationController
  active_scaffold :"report" do |config|
 
    config.create.multipart = 'local' 
    config.update.multipart = 'local'  
    #config.list.sorting = { :date => :asc }
    
    config.columns[:post_date].form_ui = :date_picker
    config.columns[:post_date].options = {options: [[changeYear: true]]}
    
    config.columns[:author].form_ui = :select
    config.columns[:source].form_ui = :select

    config.columns = [:author, :source, :title, :post_date,
     :date_string, :summary, :categories, :attachments, :congolese_companies, :cm_url]
  end
end
