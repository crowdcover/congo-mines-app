class Admin::PagesController < Admin::Auth

    # not listing/editing topic/ :category,
  columns =  [:topic, :title,  :content,  :banner]
  create_columns = columns - [:topic]



  active_scaffold :"page" do |config|
    config.actions = [:list, :update, :show]
    config.list.columns = columns
    config.update.columns = create_columns
    config.update.columns = create_columns

    config.columns[:category].form_ui = :chosen

    config.columns[:topic].form_ui = :select
    config.columns[:topic].options = {include_blank: 'Select Topic',
      options: ['EITI', 'Mining Code', 'Sicomines', 'State Enterprises', 'Human Rights'] }

    config.columns[:content].form_ui = :text_editor

    config.columns[:content].options = {
      :tinymce => {

        #This plugin matches special patterns in the text and applies formats
        # or executed commands on these text patterns. The default patterns is
        #similar to markdown syntax so you can type "# text" to produce a header
        # or "**text** to make something bold.
        #"textpattern"

        plugins: ["link","preview","searchreplace", "charmap", "table"]
        language: 'fr_FR',
        tools: "inserttable",
        #link_list: [
        #  {title: 'My page 1', value: 'http://www.tinymce.com'},
        #  {title: 'My page 2', value: 'http://www.moxiecode.com'}]

        #plugins: "preview",
      }
    }

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
