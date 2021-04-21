class JobsController < ApplicationController

    def index
        redirect_if_not_logged_in
        @jobs = Job.all
    end

    def show 
        redirect_if_not_logged_in
        @job = Job.find(params[:id])
    end
end
