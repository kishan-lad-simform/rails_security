class PasswordValidator < ActiveModel::Validator
  def validate(record)
    unless record.password =~ /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x
      record.errors[:password] << "must include at least one lowercase letter, one uppercase letter, one digit, and one special character"
    end
  end
end