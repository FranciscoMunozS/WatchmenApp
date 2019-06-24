desc 'send digest email'
task send_digest_email: :environment do
  TicketMailer.ticket_mailer(@ticket).deliver!
end
