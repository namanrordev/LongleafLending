class LoanUsersController < ApplicationController

  def create
    loan_user = LoanUser.new(loan_user_params)


    if loan_user.save
      @message = 'toto'
      SendLoandetailsJob.perform_later(loan_user)
    else
      @message = loan_user.errors.messages
    end
  end

  def show
    respond_to do |format|
      format.html do
        @loan_user = LoanUser.find(params[:id])

        SendLoandetailsJob.perform_later(@loan_user)
      end

      format.pdf do
        send_data PdfGenerator.new(@loan_user).print_data, filename:'loan_calculator.pdf', type: "application/pdf", disposition: :attachment
      end
    end
  end

  private

  def loan_user_params
    params.require(:loan_user).permit(:address, :loan_term, :purchase_price, :repair_budget, :arv, :name, :phone, :email)
  end
end
