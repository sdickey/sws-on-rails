class EmergencyContactsController < ApplicationController
  def index
  end

  def new
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.find(params[:account_id])
    @emergency_contact = @account.emergency_contacts.build(emergency_contact_params)
  end

  private
    def emergency_contact_params
      params.require(:emergency_contact).permit(:emerg_first_name, :emerg_last_name,
                     :emerg_hphone, :emerg_wphone, :emerg_cphone)
      render 'new'
    end
end
