class AccountDashboardController < ApplicationController
  def show
    # puts "this is the params hash on dashboard controller: #{params.inspect}"
    @dashboard = Account.where(id: params[:id])
  end
end
