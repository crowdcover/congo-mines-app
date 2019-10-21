# frozen_string_literal: true

# Rails App
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :set_banner_image
  protect_from_forgery with: :exception

  layout 'application'

  before_action :set_locale

  def set_locale
    @compatible_language =
      http_accept_language
      .compatible_language_from(I18n.available_locales)
    I18n.locale = session[:locale] || @compatible_language
  end

  # set banner image
  def set_banner_image
    # @banner_url = '/assets/header_banner_narrow.jpg'
    @banner_url = 'header_banner_narrow.jpg'
    @pages = Page.all.order(:position)
  end
end
