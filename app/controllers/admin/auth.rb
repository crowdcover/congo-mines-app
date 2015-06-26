class Admin::Auth  < ActionController::Base # < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: "Congomines", password: "Geowikirip" #, except: :index

  layout 'admin/auth'

  before_action :set_locale
  def set_locale
    I18n.locale = 'fr' # params[:locale] || I18n.default_locale  #:fr
  end

end
