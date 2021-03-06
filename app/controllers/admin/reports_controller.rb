# frozen_string_literal: true

class Admin::ReportsController < Admin::Auth
  active_scaffold :report do |config|
    config.columns = %i[title summary recommended visibility source categories
                        actual_post_date drc_companies attachments]

    config.label = 'Rapports'

    config.list.per_page    = 25
    config.create.multipart = 'local'
    config.update.multipart = 'local'

    config.list.sorting = { actual_post_date: :desc }

    # config.columns[:actual_post_date].label   = 'Publication Date'

    config.columns[:source].form_ui = :chosen

    config.columns[:categories].form_ui = :chosen
    config.columns[:categories].options[:optgroup] = true
    # config.columns[:categories].options = {:draggable_lists => true}

    config.columns[:drc_companies].form_ui = :chosen

    config.columns[:summary].form_ui = :text_editor

    config.columns[:visibility].form_ui = :select
    config.columns[:visibility].options = {
      # include_blank: 'Select Permit Type',
      options: %w[draft published]
    }

    config.columns[:summary].options = {
      tinymce: {

        # This plugin matches special patterns in the text and applies formats
        # or executed commands on these text patterns. The default patterns is
        # similar to markdown syntax so you can type "# text" to produce a header
        # or "**text** to make something bold.
        # "textpattern"

        plugins: %w[link preview searchreplace charmap table fullscreen paste],
        paste_as_text: true,
        # plugins: ['textpattern'],
        tools: 'inserttable',
        language: 'fr_FR',
        height: 300
        # link_list: [
        #  {title: 'My page 1', value: 'http://www.tinymce.com'},
        #  {title: 'My page 2', value: 'http://www.moxiecode.com'}]

        # plugins: "preview",
      }
    }

    # config.columns[:title].length = '60'
    # config.columns[:title].css_class = ' long-title-input'

    config.actions.add :export
    config.export.force_quotes = 'true'
    config.export.force_quotes = 'true'
  end
end
