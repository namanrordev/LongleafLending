class RemoveLoanFromLoanDetail < ActiveRecord::Migration[7.0]
  def change
    remove_reference :loan_details, :loan, null: false

    add_reference :loan_details, :loan_user, index: true, foreign_key: true
  end
end
