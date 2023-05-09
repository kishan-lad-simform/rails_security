class BankDetail < ApplicationRecord
  has_secure_password
  belongs_to :user

  validates :cvv_number, 
    numericality: { only_integer: true }, 
    length: { is: 3 }

  validates :credit_card_number, 
    uniqueness: true, 
    numericality: { only_integer: true }, 
    length: { is: 12 }
end
