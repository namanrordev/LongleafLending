class SendLoandetailsJob < ApplicationJob
  queue_as :default

  def perform(user)
    html = ApplicationController.render(
      template: 'loan_users/show',
      layout: false,
      locals: { loan_user: user }
    )
    pdf = PdfGenerator.new(html).print_data
    LoanMailer.send_mail(user, pdf.render).deliver_now
  end
end
