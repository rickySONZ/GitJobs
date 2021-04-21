module UsersHelper
    def current_user
        @current_user ||= User.find_by_id(session["user_id"]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect "/login" if !logged_in?
    end

    def redirect_if_logged_in
        redirect "/" if logged_in?
    end
end
