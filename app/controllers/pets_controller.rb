class PetsController < ApplicationController
  before_filter :authorize
  def new
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.find(params[:account_id])
    @pet = @account.pets.create(pet_params)
    render 'new'
  end

  def edit
    @account = Account.find(params[:account_id])
    @pet = @account.pets.find(params[:id])
  end

  def update
    @account = Account.find(params[:account_id])
    @pet = @account.pets.find(params[:id])

    if @pet.update(pet_params)
      render 'new'
    else
      render 'edit'
    end
  end

  def destroy
    @account = Account.find(params[:account_id])
    @pet = @account.pets.find(params[:id])
    @pet.destroy
    render 'new'
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :kind, :breed, :age, :birth_month,
                                  :health_history, :current_health, :med_name,
                                  :med_administer, :med_dose, :med_frequency,
                                  :behavior, :food_instructions, :visit_instructions)
    end
end
