class EmergencyContactsController < ApplicationController

  def new
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.find(params[:account_id])
    @emergency_contact = @account.emergency_contacts.create(emergency_contact_params)

    render 'new'
  end

  private
    def emergency_contact_params
      params.require(:emergency_contact).permit(:emerg_first_name, :emerg_last_name,
                     :emerg_hphone, :emerg_wphone, :emerg_cphone)
    end
end
