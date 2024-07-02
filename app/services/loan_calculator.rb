class LoanCalculator
  def initialize(loan)
    @loan = loan
  end

  def fundable_amount
    loan_by_purchase = 0.9 * @loan.purchase_price
    loan_by_arv = 0.7 * @loan.arv
    loan_by_rehab = @loan.repair_budget

    [loan_by_purchase, loan_by_arv, loan_by_rehab].min
  end

  def interest_expense
    monthly_interest_rate = 0.13 / 12
    loan_amt = fundable_amount

    total_interest_expense = monthly_interest_rate * loan_amt * @loan.loan_term

    total_interest_expense.round(2)
  end

  def estimated_profit
    arv_value = @loan.arv
    loan_amt = fundable_amount
    interest_exp = interest_expense

    arv_value - fundable_amount - interest_exp
  end
end
