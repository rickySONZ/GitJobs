class User < ApplicationRecord

    has_many :user_jobs
    has_many :users, through: :user_jobs
    
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
