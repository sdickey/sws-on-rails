class OwnersController < ApplicationController

  def index

  end

  def new
    @account = Account.find(params[:account_id])
  end

  def create
    puts "The parameters hash at account_id: #{params[:account_id]}"
    @account = Account.find(params[:account_id])
    puts "this is the account after assignment: #{@account.inspect}"
    @owner = @account.owners.create(owner_params)

    render 'new'
  end

  def update

  end

  def destroy

  end

  private
    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :email, :address,
                                    :home_phone, :work_phone, :cell_phone)
    end
end
