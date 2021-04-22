module UsersHelper
    
    def interested?
        self.user_jobs.where(interested: true)
    end
end
