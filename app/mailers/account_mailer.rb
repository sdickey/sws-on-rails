class AccountMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.account_mailer.password_reset.subject
  #
  def password_reset(account)
    @account = account
    mail :to => account.email, :subject => "Password Reset"
  end
end
