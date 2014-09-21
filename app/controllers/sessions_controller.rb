class SessionsController < ApplicationController

  def new
  end

  def create
    account = Account.authenticate(params[:email], params[:password])
    if account
      session[:account_id] = account.id
      if account.owners.empty?
        redirect_to new_account_owner_path(session[:account_id])
      else
        redirect_to account_dashboard_path(session[:account_id]), notice: "You've logged in!"
      end
    else
      flash.now.alert = "Invalid email or password."
      render "new"
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to root_url, notice: "You're logged out."
  end

end
