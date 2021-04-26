class UserJob < ApplicationRecord
    belongs_to :job
    belongs_to :user

    scope :interested?, -> { where(interested: true)}

    scope :applied?, -> { where(applied: true)}

    
end
