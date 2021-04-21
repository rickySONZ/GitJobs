class SessionsController < ApplicationController

    def new
        
        redirect_if_logged_in
    end
  
    def create
        api_request
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:message] = "Welcome to GitJobs!"
            redirect_to '/'
        else
            flash[:message] = "Invalid login attempt."
            render :'/sessions/new'
        end
      end
  
    def destroy
        session.delete :user_id
        redirect_to login_path
    end 

    private
    def api_request
        Api.pull_new_postings
    end

end
