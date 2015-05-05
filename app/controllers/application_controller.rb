class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #http_basic_authenticate_with name: "congo", password: "mines" #, except: :index
  
  layout 'application'
  
  before_action :set_locale
   
  def set_locale
    I18n.locale =  params[:locale] || I18n.default_locale
  end 
  
end
