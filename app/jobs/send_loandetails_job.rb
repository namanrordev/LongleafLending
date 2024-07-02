class SendLoandetailsJob < ApplicationJob
  queue_as :default

  def perform(user)
    LoanMailer.send_mail(user).deliver_now
  end
end
