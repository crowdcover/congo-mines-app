# frozen_string_literal: true

module ApplicationHelper
  def active?(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def current_locale?(locale)
    I18n.locale == locale
  end

  def title
    if content_for?(:title)
      # allows the title to be set in the view by using t(".title")
      content_for :title
    else
      # look up translation key based on controller path, action name and .title
      # this works identical to the built-in lazy lookup
      t("#{controller_path.tr('/', '.')}.#{action_name}.title", default: :site_name)
    end
  end

  def tags(tag_args)
    tag_args.keys.each do |tag|
      content_for(tag, tag_args[tag])
    end
  end
end
