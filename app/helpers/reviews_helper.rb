module ReviewsHelper

    def fields_for_helper(f)
        if @job
            f.hidden_field :job_id, value: @job.id
        else
            render partial: "fields_for", locals: {f: f}
        end
    end

    
    
end
