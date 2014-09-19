class EmergencyContactsController < ApplicationController

  def new
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.find(params[:account_id])
    @emergency_contact = @account.emergency_contacts.create(emergency_contact_params)

    render 'new'
  end

  def edit
    @account = Account.find(params[:account_id])
    @emergency_contact = @account.emergency_contacts.find(params[:id])
  end

  def update
    @account = Account.find(params[:account_id])
    @emergency_contact = @account.emergency_contacts.find(params[:id])

    if @emergency_contact.update(emergency_contact_params)
      render 'new'
    else
      render 'edit'
    end
  end

  def destroy
    @account = Account.find(params[:account_id])
    @emergency_contact = @account.emergency_contacts.find(params[:id])
    @emergency_contact.destroy
    render 'new'
  end

  private
    def emergency_contact_params
      params.require(:emergency_contact).permit(:emerg_first_name, :emerg_last_name,
                     :emerg_hphone, :emerg_wphone, :emerg_cphone)
    end
end
