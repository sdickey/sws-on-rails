module LoginMacros
  def set_account_session(account)
   session[:account_id] = account.id
  end

  def sign_in(account)
    visit root_path
    click_link 'login'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_button 'Log in'
  end
end