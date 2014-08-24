class AccountsController < ApplicationController
  http_basic_authenticate_with name: "FurryKids", password: "petsrule"

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to root_url #new_owner_path
    else
      render 'new'
    end
  end

  private
    def account_params
      params.require(:account).permit(:email, :email_confirmation, :password, :password_confirmation)
    end
end
