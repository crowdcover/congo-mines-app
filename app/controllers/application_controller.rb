class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_filter :set_banner_image
  protect_from_forgery with: :exception

  #http_basic_authenticate_with name: "congo", password: "mines" #, except: :index

  layout 'application'

  before_action :set_locale

  def set_locale
    I18n.locale =  params[:locale] || 'fr' #I18n.default_locale
  end

  # set banner image
  def set_banner_image
    #@banner_url = '/assets/header_banner_narrow.jpg'
    @banner_url = 'header_banner_narrow.jpg'
    @pages = Page.all.order(:position)
  end

end
