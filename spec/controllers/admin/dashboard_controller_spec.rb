require 'rails_helper'

RSpec.describe Admin::DashboardController, :type => :controller do

  describe 'user access' do
    describe "GET index" do
      it "returns http success" do
        account = Account.create(
          email: 'admin@example.com',
          email_confirmation: 'admin@example.com',
          password: 'ccccCC1!!!',
          password_confirmation: 'ccccCC1!!!'
        )
        session[:account_id] = account.id

        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'non-user access' do
    describe 'GET index' do
      it "redirects to the login form" do
        get :index
        expect(response).to redirect_to login_path
      end
    end
  end
end
