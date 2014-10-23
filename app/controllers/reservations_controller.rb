class ReservationsController < ApplicationController
  before_filter :authorize
  before_filter :is_admin?, only: [:update]


  def new
    @account = Account.find(params[:account_id])
    @reservation = @account.reservations.build
  end

  def create
    @account = Account.find(params[:account_id])
    @reservation = @account.reservations.create(reservation_params)
    if @reservation.save
      ReservationMailer.reservation_requested(@reservation, @account).deliver
      flash[:notice] = "Your reservation request has been sent!
      We'll be in contact soon. Please note that reservations are
      not added to our visit calendar until they are approved and
      we have received a 50% deposit."
      redirect_to account_dashboard_path(@account.id)
    else
      flash[:alert] = "We're sorry, but something went wrong. Your
      reservation request couldn't be sent. Please try again."
      render 'new'
    end
  end

  def edit
    @account = Account.find(params[:account_id])
    @reservation = @account.reservations.find(params[:id])
  end

  def update
    @account = Account.find(params[:account_id])
    @reservation = @account.reservations.find(params[:id])

    if !is_admin?
      if @reservation.update(reservation_params)
        ReservationMailer.reservation_update_by_client(@reservation, @account).deliver
        flash[:notice] = "Your reservation has been updated!"
        redirect_to account_dashboard_path(@account.id)
      else
        flash[:notice] = "We're sorry but your reservation couldn't
        be updated. Please try again."
        render 'edit'
      end
    else
      if @reservation.update(reservation_params)
        ReservationMailer.reservation_update_by_admin(@reservation, @account).deliver
        flash[:notice] = "This reservation has been updated"
        redirect_to admin_reservations_path
      else
        flash[:notice] = "Sorry, but your updates couldn't be
        saved. Please try again."
      end
    end
  end

  def destroy
    @account = Account.find(params[:account_id])
    @reservation = @account.reservations.find(params[:id])
    @reservation.destroy
    flash[:notice] = "Your reservation has been deleted."
    redirect_to account_dashboard_path(@account.id)
  end

  private
    def reservation_params
      params.require(:reservation).permit(:first_name, :last_name, :depart_date, :depart_time,
                                          :depart_num_visits, :overnight_on_depart,
                                          :return_date, :return_time, :return_num_visits,
                                          :num_std_visits_between, :custom_std_visit_schedule,
                                          :std_visit_instructions, :overnights_between,
                                          :overnight_instructions, :leaving_country,
                                          :visit_updates_method, :availability_confirmed,
                                          :deposit_confirmed)
    end
end

