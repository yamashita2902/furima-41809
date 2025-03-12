class ApplicationController < ActionController::Base
  before_action :basic_auth
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def index
    
  end
  
  def new
    @user = User.new
  end

  
  private


  def basic_auth
    Rails.logger.debug "Basic Auth method called!"
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:password_confirmation,:name_zennkaku_myouzi ,:name_zennkaku_namae,:name_kana_myouzi,:name_kana_namae,:birthday])
  end
end
