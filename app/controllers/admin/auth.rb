# frozen_string_literal: true

class Admin::Auth < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASS'] # , except: :index

  layout 'admin/auth'

  before_action :set_locale
  def set_locale
    I18n.locale = session[:locale] || http_accept_language.compatible_language_from(I18n.available_locales)
  end
end
