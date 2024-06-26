class ApplicationController < ActionController::Base
    include Pagy::Backend

    before_action :set_locale
    before_action :configure_permitted_parameters, if:  :devise_controller?
    protect_from_forgery with: :exception
    before_action :set_room
    before_action :current_cart
    before_action :over_categories
    before_action :set_locale


  def set_locale
    I18n.locale = :fr
    #I18n.locale = params[:lang] || locale_from_header || I18n.default.locale
  end

  def locale_from_header
    request.env.fetch('HTTP_ACCEPT_LANGUAGE','').scan(/[a-z]{2}/).first
  end

  def current_cart
    @current_cart ||= ShoppingCart.new(token: cart_token)
  end

  helper_method :current_cart
  helper_method :over_categories

  private

  def cart_token
    return @cart_token unless @cart_token.nil?

    session[:cart_token] ||= SecureRandom.hex(8)
    @cart_token = session[:cart_token]
  end

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end

    def require_admin_logged_in!
        if !current_user
            redirect_to new_user_session_path, alert: "You need to be signed in to access that page !" 
        else
            if !current_user.admin
                redirect_to root_path, alert: "Only admins are authorized to access that page, if you're an admin please sign in with your admin account." 
            end
        end
    end
    
    def require_user_logged_in!
        if !current_user
            redirect_to new_user_session_path, alert: "You need to be signed in to do that !" 
        end
    end

    def show
        @rooms = Room.all
        @items = current_cart.order.items
    end

    
    private
    def set_room
        if current_user
            @room = current_user.room || current_user.build_room(name: current_user.email)
            current_user.save
        else
            @room=Room.new
        end
    end

    
    def over_categories
        @overCategories = OverCategory.all
    end

    def room_params
      params.require(:room).permit(:name)
    end


    
end

