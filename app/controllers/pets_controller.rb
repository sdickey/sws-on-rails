class PetsController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.find(params[:account_id])
    @pet = @account.pets.create(pet_params)
    render 'new'
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :kind, :breed, :age, :birth_month,
                                  :health_history, :current_health, :med_name,
                                  :med_administer, :med_dose, :med_frequency,
                                  :behavior)
    end
end
