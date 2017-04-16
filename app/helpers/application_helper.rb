module ApplicationHelper
  def is_active?(link_path)
    current_page?(link_path) ? "active" : ""
  end

   def current_locale?(locale)
    I18n.locale == locale
  end

end
