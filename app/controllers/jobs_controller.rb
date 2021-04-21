class JobsController < ApplicationController

    def index
        redirect_if_not_logged_in
        @jobs = Job.all
    end

    def show 
        redirect_if_not_logged_in
        @job = Job.find(params[:id])
        @review = @job.reviews.build
        @reviews = @job.reviews
    end

    def update
    end

    private 

    def job_params
        params.require(:job).permit(:title, :posting_id, :location, :description, :company_logo, :how_to_apply, review_attributes: [:title, :content, :user_id])
    end
end
