class LoanMailer < ApplicationMailer
  default from: 'abc@gmail.com'

  def send_mail(loan_user)
    @loan_user = loan_user

    mail(to: 'test@yopmail.com', subject: 'New registration page submission')
  end
end