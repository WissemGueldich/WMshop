class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if:  :devise_controller?
    before_action :set_room

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:age])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name,:age])

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

    def show
        @rooms = Room.all
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

    def room_params
      params.require(:room).permit(:name)
    end
end
