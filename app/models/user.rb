class User < ApplicationRecord
    has_secure_password

    # Validate email presence is True or email is Mandatory
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a vaild email address" }
end
