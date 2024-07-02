class CreateLoanDetail < ActiveRecord::Migration[7.0]
  def change
    create_table :loan_details do |t|
      t.decimal :max_fundable_amount, precision: 10, scale: 2
      t.decimal :total_interest_expense, precision: 10, scale: 2
      t.decimal :estimated_profit, precision: 10, scale: 2
      t.references :loan, foreign_key: true

      t.timestamps
    end
  end
end
