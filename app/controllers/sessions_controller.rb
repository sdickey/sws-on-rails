class SessionsController < ApplicationController

  def new
  end

  def create
    account = Account.authenticate(params[:email], params[:password])
    if account
      session[:account_id] = account.id
      if account.owners.empty?
        redirect_to new_account_owner_path(session[:account_id])
        #redirect_to admin_path #change this back to previous once is_admin? before_filter is in place. Also, it needs its own if statement at top, and the account.owners.empty? check will move to an 'elsif'.
      else
        # redirect_to account_dashboard_path(session[:account_id]), notice: "You've logged in!"
        redirect_to admin_path
      end
    else
      flash.now.alert = "Invalid email or password."
      render "new"
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to new_session_path, notice: "You're logged out."
  end

end
