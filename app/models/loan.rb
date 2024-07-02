class Loan < ApplicationRecord
  has_one :loan_detail

  validates :address, presence: true
  validates :loan_term, presence: true, numericality: { only_integer: true }
  validates :purchase_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :repair_budget, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :arv, presence: true, numericality: { greater_than_or_equal_to: :purchase_price }
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true

  after_save :calculate_loan_details

  private

  def calculate_loan_details
    loan_detail = self.loan_detail || build_loan_detail
    loan_detail.max_fundable_amount = LoanCalculator.new(self).fundable_amount
    loan_detail.total_interest_expense = LoanCalculator.new(self).interest_expense
    loan_detail.estimated_profit = LoanCalculator.new(self).estimated_profit
    loan_detail.save!
  end
end
