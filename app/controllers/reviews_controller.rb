class ReviewsController < ApplicationController

    before_action :find_job
    before_action :redirect_if_not_logged_in
   

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
            render :new
    end
end

def edit 
    @review = Review.find_by_id(params[:id])
    @job = Job.find_by_id(@review.user_id)
    
    if not_authorized
        redirect_if_not_authorized
        flash[:message] = "I'm sorry but you can only edit reviews made by your account"
    end
end

def update 
    @review = Review.find_by_id(params[:id])
    @review.update(review_params)

    if @review.valid?
        redirect_to review_path(@review)
    else
        render :edit
    end
end

def destroy
    @review = Review.find_by_id(params[:id])
    if not_authorized
        flash[:message] = "I'm sorry but you can only delete reviews made by your account."
        redirect_if_not_authorized
    else
        @review.destroy
        flash[:message] = "Your review has been deleted successfully"
        redirect_to '/'
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
