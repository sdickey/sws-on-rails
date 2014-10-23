class ReservationMailer < ActionMailer::Base

  def reservation_requested(reservation, account)
    @reservation = reservation
    @account = account
    mail to: 'sean.a.dickey5@gmail.com', from: account.email, subject: 'SWS Reservation Request'
  end

  def reservation_update_by_admin(reservation, account)
    @reservation = reservation
    @account = account
    mail to: account.email, from: 'sean.a.dickey5@gmail.com', subject: 'Pet Sitting Reservation Update'
  end

  def reservation_update_by_client(reservation, account)
    @reservation = reservation
    @account = account
    mail to: 'sean.a.dickey5@gmail.com', from: account.email, subject: 'Client Update to Reservation'
  end
end
