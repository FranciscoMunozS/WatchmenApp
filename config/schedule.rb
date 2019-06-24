ENV['RAILS_ENV'] = "production"

every 1.minute do
  rake "TicketMailer.ticket_mailer"
end
