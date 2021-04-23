class JobsController < ApplicationController

    before_action :find_user, only: [:show, :index]
    # before_action :find_user_job, only: [:show]


    def index
        redirect_if_not_logged_in
        @jobs = Job.all
    end

    def show 
        redirect_if_not_logged_in
        @job = Job.find(params[:id])
        @user_jobs = UserJob.all
        @reviews = @job.reviews
        @review = @job.reviews.build
        if @user_job = UserJob.find_by(job_id: @job.id, user_id: @user.id)
            @user_job = UserJob.find_by(job_id: @job.id, user_id: @user.id)
        else
            @user_job = UserJob.new
        end
    end

    def update
        @user_job.job_id = @job.id
        @user_job.user_id = @user.id
        @user_job.save
    end

    private 

    def job_params
        params.require(:job).permit(:title, :posting_id, :location, :description, :company_logo, :how_to_apply, review_attributes: [:title, :content, :user_id])
    end

    def find_user
        @user = current_user
    end
    # def find_user_job
    #     if @user_job = UserJob.find_by(job_id: @job.id, user_id: @user.id)
    #         @user_job
    #     else
    #         @user_job = UserJob.new
    #     end
    # end
end
