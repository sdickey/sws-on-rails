class AccountDashboardController < ApplicationController
  before_filter :authorize
  def show
    @account = Account.find(params[:id])
  end
end
