class LoanDetail < ApplicationRecord
  belongs_to :loan_user

  validates :max_fundable_amount, :total_interest_expense, :estimated_profit, presence: true
end
