class AccountsController < ApplicationController
  http_basic_authenticate_with name: "FurryKids", password: "petsrule"

  def new

  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to new_owner_path
    end
  end

  private
    def account_params
      params.require(:account).permit(:username, :password, :password_confirmation)
    end
end
