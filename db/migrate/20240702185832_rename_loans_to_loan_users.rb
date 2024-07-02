class RenameLoansToLoanUsers < ActiveRecord::Migration[7.0]
  def change
    rename_table :loans, :loan_users
  end
end
