module ApplicationHelper

    def current_user
        @current_user ||= User.find_by_id(session["user_id"]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to "/login" if !logged_in?
    end

    def redirect_if_logged_in
        redirect_to "/" if logged_in?
    end

    def redirect_if_not_authorized
        review = Review.find_by_id(params[:id])
        if review == nil || review.user_id != session["user_id"]
           redirect_to "/"
        end
    end

    def not_authorized
        @review = Review.find_by_id(params[:id])
        @review.user_id != session["user_id"]
    end
end
