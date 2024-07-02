class Loan < ApplicationRecord
  validates :address, presence: true
  validates :loan_term, presence: true, numericality: { only_integer: true }
  validates :purchase_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :repair_budget, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :arv, presence: true, numericality: { greater_than_or_equal_to: :purchase_price }
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true
end
