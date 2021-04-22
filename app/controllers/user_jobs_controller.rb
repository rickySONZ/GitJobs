class UserJobsController < ApplicationController

    def edit 
        self.find_user_job
    end
    def update

    end
    def new
        @user_job = UserJob.new
    end

    def create
        @user_job = current_user.user_jobs.find_or_create_by(job_id: params[:user_job][:job_id])
        @user_job.user_id = params[:user_job][:user_id]
        @user_job.applied = params[:user_job][:applied]
        @user_job.interested = params[:user_job][:interested]
        if @user_job.save
            redirect_to '/'
        end

    end

end
