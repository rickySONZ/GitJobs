class Job < ApplicationRecord

    has_many :user_jobs
    has_many :users, through: :user_jobs

    validates :title, presence: true
    validates :posting_id, uniqueness: true

    
end
