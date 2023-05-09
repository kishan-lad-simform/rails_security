class User < ApplicationRecord
  has_secure_password
  has_many :bank_details
  
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :email, uniqueness: true, presence: true

end