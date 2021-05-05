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
            flash[:message] = "Invalid login attempt. Username and/or password do not match any active accounts."
            render :new
        end
      end

      def omniauth
        @user =User.find_or_create_by(username: auth[:info][:email]) do |u|
            u.email = auth[:info][:email]
            u.username = auth[:info][:email]
            u.uid = auth[:uid]
            u.provider = auth[:provider]
            u.password = SecureRandom.hex(10)
        end

        if @user.valid?
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:message] = "I'm sorry an error occurred when attempting to log you in"
            redirect_to login_path
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

    def auth
        request.env['omniauth.auth']
    end

end
