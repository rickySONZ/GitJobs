module JobsHelper

    def sanitized_description(job)
        sanitize job.description
    end
end
