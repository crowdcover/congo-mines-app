class Admin::ReportsController  < Admin::Auth # ApplicationController
  active_scaffold :"report" do |config|

    config.columns = [:title,  :summary, :recommended, :source, :categories, 
      :actual_post_date, :drc_companies, :attachments] 
 
    config.list.per_page    = 25 
    config.create.multipart = 'local' 
    config.update.multipart = 'local' 
    
    config.list.sorting = { :actual_post_date => :desc }

    config.columns[:actual_post_date].label   = 'Publication Date' 
    config.columns[:actual_post_date].form_ui = :date_picker
    config.columns[:actual_post_date].options = {options: [[changeYear: true]]}
    
    config.columns[:source].form_ui         = :chosen
    config.columns[:categories].form_ui     = :chosen
    config.columns[:drc_companies].form_ui  = :chosen
    
    config.columns[:summary].form_ui = :text_editor

    #config.columns[:title].css_class = ' form-control input-lg'
    
  end
end
