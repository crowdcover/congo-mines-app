class Admin::PagesController < Admin::Auth
  active_scaffold :"page" do |config|
  
    config.columns = [:topic, :title,  :content, :categories, :banner]
    
    config.columns[:categories].form_ui = :chosen
    
    config.columns[:topic].form_ui = :select
    config.columns[:topic].options = {include_blank: 'Select Topic', 
      options: ['EITI', 'Mining Code', 'Sicomines', 'State Enterprises', 'Human Rights'] }

    config.columns[:content].form_ui = :text_editor
 
=begin  
    config.columns[:content].options = {
      tinymce: {  
        	selector: "textarea",
	        plugins: ["advlist autolink lists link image charmap print preview anchor",
		"searchreplace visualblocks code fullscreen",
		"insertdatetime media table contextmenu paste moxiemanager"],
		
	      toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify |      bullist numlist outdent indent | link image",
	      autosave_ask_before_unload: false

        # :theme => 'advanced',
        # :editor_css => '/product_editor.css'
      }
    }
=end      
    
  end
end
