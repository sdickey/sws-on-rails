class ReservationsController < ApplicationController
  def new
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.find(params[:account_id])
    @reservation = @account.reservations.create(reservation_params)
    if @reservation.save
      flash[:notice] = "Your reservation request has been sent!
      We'll be in contact soon. Please note that reservations are
      not added to our visit calendar until they are approved and
      we have received a %50 deposit."
      redirect_to account_dashboard_path(@account.id)
    else
      flash[:alert] = "We're sorry, but something went wrong. Your
      reservation request couldn't be sent. Please try again."
      render 'new'
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:name, :depart_date, :depart_time,
                                          :depart_num_visits, :overnight_on_depart,
                                          :return_date, :return_time, :return_num_visits,
                                          :num_std_visits_between, :custom_std_visit_schedule,
                                          :std_visit_instructions, :overnights_between,
                                          :overnight_instructions, :leaving_country,
                                          :visit_updates_method)
    end
end

