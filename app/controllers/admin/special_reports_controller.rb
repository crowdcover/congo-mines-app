# frozen_string_literal: true

class Admin::SpecialReportsController < Admin::Auth
  # not listing/editing topic/ :category,
  columns = %i[tag title title_en content content_en]
  # create_columns = columns - [:topic]

  active_scaffold :special_report do |config|
    config.label = 'Pages Spécial'
    # config.actions = [:list, :update, :show]
    config.list.columns = %i[tag title title_en]

    config.update.columns = columns

    config.columns[:content].form_ui = :text_editor
    config.columns[:content_en].form_ui = :text_editor

    # config.actions << :sortable
    # config.sortable.column = :position

    config.columns[:content].options = {
      tinymce: {
        plugins: %w[link image preview searchreplace charmap table fullscreen paste lists],
        paste_as_text: true,
        language: I18n.locale == 'fr' ? 'fr_FR' : 'en',
        tools: 'inserttable',
        toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist checklist | forecolor backcolor casechange permanentpen formatpainter removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media pageembed template link anchor',
        height: 300
      }
    }
    config.columns[:content_en].options = {
      tinymce: {
        plugins: %w[link image preview searchreplace charmap table fullscreen paste lists],
        paste_as_text: true,
        language: I18n.locale == 'fr' ? 'fr_FR' : 'en',
        tools: 'inserttable',
        toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist checklist | forecolor backcolor casechange permanentpen formatpainter removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media pageembed template link anchor',
        height: 300
      }
    }
  end
end
