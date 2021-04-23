class UserJobsController < ApplicationController

    before_action :find_job, only: [:edit, :new, :create, :update]

    def edit 
        @user_job = UserJob.find_by_id(params[:id])
    end

    def update
        @user_job = UserJob.find_by_id(params[:id])
        @user_job.job_id = params[:user_job][:job_id]
        @user_job.user_id = params[:user_job][:user_id]
        @user_job.applied = params[:user_job][:applied]
        @user_job.interested = params[:user_job][:interested]
        if @user_job.save
            redirect_to '/'
        else
            flash[:message] = "Didnt Save"
            redirect_to '/'
        end

    end

    def new
        @user_job = UserJob.new
    end

    def create
        @user_job = UserJob.new
        @user_job.job_id = params[:user_job][:job_id]
        @user_job.user_id = params[:user_job][:user_id]
        @user_job.applied = params[:user_job][:applied]
        @user_job.interested = params[:user_job][:interested]
        if @user_job.save
            redirect_to '/'
        else
            flash[:message] = "Didnt Save"
            redirect_to '/'
        end

    end

    def find_job
        @job = Job.find_by_id(params[:job_id])
    end

end
