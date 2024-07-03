class LoanMailer < ApplicationMailer
  default from: 'abc@gmail.com'

  def send_mail(loan_user, pdf_content)
    @loan_user = loan_user
    attachments["loan_calculator.pdf"] = pdf_content

    mail(to: loan_user.email, subject: 'Loan Details')
  end
end