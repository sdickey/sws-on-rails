class OwnersController < ApplicationController

  def index

  end

  def new
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.find(params[:account_id])
    @owner = @account.owners.create(owner_params)

    render 'new'
  end

  def edit
    @account = Account.find(params[:account_id])
    @owner = @account.owners.find(params[:id])
  end

  def update
    @account = Account.find(params[:account_id])
    @owner = @account.owners.find(params[:id])

    if @owner.update(owner_params)
      render 'new'
    else
      render 'edit'
    end
  end

  def destroy
    @account = Account.find(params[:account_id])
    @owner = @account.owners.find(params[:id])
    @owner.destroy
    render 'new'
  end

  private
    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :email, :address,
                                    :home_phone, :work_phone, :cell_phone)
    end
end
