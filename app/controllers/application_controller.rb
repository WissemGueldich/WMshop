class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if:  :devise_controller?
    protect_from_forgery with: :exception

    before_action :current_cart

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end
  helper_method :current_cart

  private

  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:age])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name,:age])
    end
end

