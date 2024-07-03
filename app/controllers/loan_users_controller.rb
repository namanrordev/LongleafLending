class LoanUsersController < ApplicationController

  def create
    @loan_user = LoanUser.new(loan_user_params)


    if @loan_user.save
      @message = 'toto'
      SendLoandetailsJob.perform_later(@loan_user)

      render html: "<div><p style='text-align: center;'>Thanks, #{@loan_user.name}! Here are those figures we promised.</p><p style='text-align: center;'>And again, check your email for the Longleaf term sheet</p><p style='text-align: center;'>Your Estimated Profit: $#{@loan_user.loan_detail.estimated_profit}</p><p style='text-align: center;'>Loan Amount: $#{@loan_user.loan_detail.max_fundable_amount}</p></div>".html_safe
    else
      render html: @loan_user.errors.messages
    end
  end

  def show
    respond_to do |format|
      format.html do
        @loan_user = LoanUser.find(params[:id])

        SendLoandetailsJob.perform_later(@loan_user)

        render html: '<p style= "text-align: center;">Sent Details To Your Mail</p>'.html_safe
      end
    end
  end

  private

  def loan_user_params
    params.require(:loan_user).permit(:address, :loan_term, :purchase_price, :repair_budget, :arv, :name, :phone, :email)
  end
end
