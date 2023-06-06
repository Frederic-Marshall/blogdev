class ApplicationController < ActionController::Base
  before_action :set_locale
  add_flash_types :success, :danger, :info, :warning
  
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
