class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  validates_format_of :password, 
    with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x,
    message: "Give atleast one small and one capital letter, one special symbol and one digit. "
  validates :password, length: { in: 8..20 }
end
