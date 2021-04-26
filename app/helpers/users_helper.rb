module UsersHelper
    
    def interest_list
        current_user.user_jobs.interested?
    end

    def applied_list
        current_user.user_jobs.applied?
    end
end
