require 'httparty'

class Api < ActiveRecord::Base
  
    def self.pull_new_postings
        @url = "https://jobs.github.com/positions.json?location=united+states"
        job_array = HTTParty.get(@url)
        job_array.each do |job_hash|
            Job.create(:title => job_hash["title"], :posted_at => job_hash["created_at"], :company => job_hash["company"], :posting_id => job_hash["id"], :location => job_hash["location"], :company_logo => job_hash["company_logo"], :how_to_apply => job_hash["how_to_apply"], :description => job_hash["description"])
        end
    end
    
end