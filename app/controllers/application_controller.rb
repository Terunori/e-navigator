class ApplicationController < ActionController::Base
  require 'date'

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :gender, :school])
  end
end
