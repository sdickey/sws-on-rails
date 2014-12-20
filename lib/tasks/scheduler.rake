desc "These tasks are called by the Heroku scheduler add-on"
task :send_reservation_reminder_email => :environment do
  puts "Sending today's reservation reminders..."
  Reservation.reservation_reminder_email
  puts "All done. Everyone has been reminded."
end

task :remove_old_reservations => :environment do
  puts "Clearing out old reservations"
  Reservation.clear_old_reservations
  puts "Old reservations have been removed."
end