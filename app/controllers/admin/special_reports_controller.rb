class Admin::SpecialReportsController < Admin::Auth

    # not listing/editing topic/ :category,
  columns =  [:title,  :content]
  #create_columns = columns - [:topic]



  active_scaffold :"special_report" do |config|
    #config.actions = [:list, :update, :show]
    config.list.columns = [:title]

    config.update.columns = columns

    config.columns[:content].form_ui = :text_editor

    #config.actions << :sortable
    #config.sortable.column = :position

    config.columns[:content].options = {
      :tinymce => {

        #This plugin matches special patterns in the text and applies formats
        # or executed commands on these text patterns. The default patterns is
        #similar to markdown syntax so you can type "# text" to produce a header
        # or "**text** to make something bold.
        #"textpattern"

        plugins: ["link","image","preview","searchreplace", "charmap", "table", "fullscreen", "paste"],
        paste_as_text: true,
        language: 'fr_FR',
        tools: "inserttable",
        height: 300
      }
    }

  end
end
