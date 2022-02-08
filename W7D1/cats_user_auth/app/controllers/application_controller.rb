class ApplicationController < ActionController::Base
    # skip_before_action :verify_authenticity_token
    # protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_logged_in
        redirect_to new_user_url unless current_user

        # if !current_user
        #     redirect_to new_user_url
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def logged_in?
        !!current_user
    end
end
