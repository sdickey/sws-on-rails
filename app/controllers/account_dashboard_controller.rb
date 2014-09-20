class AccountDashboardController < ApplicationController
  def show
    @account = Account.find(params[:id])
  end
end
