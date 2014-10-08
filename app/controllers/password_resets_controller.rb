class PasswordResetsController < ApplicationController
  def new
  end

  def create
    account = Account.find_by_email(params[:email])
    account.send_password_reset if account
    redirect_to root_url, :notice => "Email sent. Check your inbox for password reset instructions."
  end

  def edit
    @account = Account.find_by_password_reset_token!(params[:id])
  end

  def update
    @account = Account.find_by_password_reset_token!(params[:id])
    if @account.password_reset_sent_at < 1.hour.ago
      redirect_to new_password_reset_path, :alert => 'Password reset has expired.'
    elsif @account.update_attributes(password_reset_params)
      redirect_to new_session_path, :notice => 'Your password has been reset.'
    else
      render 'edit'
    end
  end

  private
    def password_reset_params
      params.require(:account).permit(:email, :email_confirmation, :password, :password_confirmation)
    end
end
