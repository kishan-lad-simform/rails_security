class AddRefUserToBankDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :bank_details, :user, foreign_key: true
  end
end
