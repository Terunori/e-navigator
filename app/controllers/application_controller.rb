class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!

  private
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || super
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

end
