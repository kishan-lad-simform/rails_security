class CreateBankDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_details do |t|
      t.string :account_holder_name
      t.string :cvv_number
      t.string :credit_card_number
      t.string :password_digest

      t.timestamps
    end
  end
end
