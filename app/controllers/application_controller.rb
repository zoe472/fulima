class ApplicationController < ActionController::Base
  before_action :basic_auth,  if: :production? 
  protect_from_forgery with: :exception

  #deviseのカラムを追加したため、カラムを承認するための記述
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :familyname, :name, :kana_familyname, :kana_name, :birthday])
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
     
    end
  end
end