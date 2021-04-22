class ReviewsController < ApplicationController

    before_action :find_job, only: [:index, :new, :create, :show]
   

    def show
        @review = Review.find(params[:id])
    end

    def index
        if @job
            @reviews = @job.reviews
        else
            @reviews = Review.all
        end
    end
    
    def new
        if @job
            @review = @job.reviews.build
        else
            @review = Review.new
            @jobs = Job.all
        end
    end

    def create

        @review = Review.new(review_params)
        @review.user_id = current_user.id
        @review.job_id = @job.id if @job

        if @review.save
            if @job
                redirect_to "/jobs/#{@job.id}/reviews"
            else
                redirect_to "/reviews/#{@review.id}"
            end
        else
            flash[:message] = "Reviews need a title and a description"
            render :new
    end
end

    private

    def review_params
        params.require(:review).permit(:content, :title, :job_id, :user_id)
    end

    def find_job
        @job = Job.find_by_id(params[:job_id])
    end


end
