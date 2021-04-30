module JobsHelper

    def sanitized_description(job)
        sanitize job.description
    end

    def find_job_from_user_job(uj)
        "#{Job.find_by_id(uj.job_id).company} - #{Job.find_by_id(uj.job_id).title}"
    end

    def display_logo(job)
        if job.company_logo == nil
            nil
        else
            image_tag "#{job.company_logo}", height: 100, width: 100
        end
    end

    def current_user
        @current_user ||= User.find_by_id(session["user_id"]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

end
