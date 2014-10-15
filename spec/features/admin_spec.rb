# spec/features/admin_spec.rb

require 'rails_helper'

describe "Admin" do
  it "accesses the dashboard" do
    Account.create(
      email: 'user@example.com',
      email_confirmation: 'user@example.com',
      password: 'ccccCC1!!!',
      password_confirmation: 'ccccCC1!!!'
    )

    visit root_path
    click_link 'login'
    fill_in 'email', with: 'user@example.com'
    fill_in 'password', with: 'ccccCC1!!!'
    click_button 'Log in'

    expect(current_path).to eq admin_path
    within 'h1' do
      expect(page).to have_content 'Administration'
    end
      expect(page).to have_content 'Manage Accounts'
      expect(page).to have_content 'Manage Reservations'
  end

  it "is denied access when not logged in" do
    visit admin_path

    expect(current_path).to eq login_path
    expect(page).to have_content 'You have to log in to do that.'
  end

  describe "account management" do
    before :each do
      account = FactoryGirl.create(:account)
      visit root_path
      click_link 'login'
      fill_in 'email', with: account.email
      fill_in 'password', with: account.password
      click_button 'Log in'
    end

    it "deletes an account" do
      click_link 'Manage Accounts'
      expect(current_path).to eq admin_accounts_path

      expect {
        click_link 'delete'
      }.to change(Account, :count).by(1)

      expect(current_path).to eq admin_accounts_path
      expect(page).to have_content 'Manage Accounts'
    end
  end
end