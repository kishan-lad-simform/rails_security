class RemoveColFromBankDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :bank_details, :account_holder_name, :string
  end
end
