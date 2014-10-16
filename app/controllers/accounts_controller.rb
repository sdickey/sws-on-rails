class AccountsController < ApplicationController
  http_basic_authenticate_with name: "FurryKids", password: "petsrule"

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  def update
    @account = Account.find(params[:id])
    @account.update(account_params)
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to admin_path
  end

  private
    def account_params
      params.require(:account).permit(:email, :email_confirmation, :password,
                                      :password_confirmation, :keys_on_file,
                                      :admin)
    end
end
