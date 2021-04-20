module JobsHelper

    def sanitized_description(job)
        sanitize job.description
    end

    def display_logo(job)
        if job.company_logo == nil
            nil
        else
            image_tag "#{job.company_logo}", height: 100, width: 100
        end
    end

end
