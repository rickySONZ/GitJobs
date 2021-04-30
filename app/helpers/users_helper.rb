module UsersHelper
    
    def interest_list
        current_user.user_jobs.interested? if current_user
    end

    def applied_list
        current_user.user_jobs.applied? if current_user
    end
end
