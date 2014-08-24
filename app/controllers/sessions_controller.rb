class SessionsController < ApplicationController

  def new
  end

  def create
    account = Account.authenticate(params[:email], params[:password])
    if account
      session[:account_id] = account.id
      redirect_to root_url, notice: "You've logged in!" #change to account_dashboard for production
    else
      flash.now.alert = "Invalid email or password."
      render "new"
    end
  end

end
