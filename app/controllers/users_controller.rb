class UsersController < ApplicationController
    before_action :api_request, only: [:home]
    def new

    end

    def home
        
    end


    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else
            flash[:error] = "#{@user.errors.full_messages.join(", ")}"
            redirect_to '/users/new'
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def api_request
        Api.pull_new_postings
    end


end
