# Preview all emails at http://localhost:3000/rails/mailers/second_notification_mailer
class SecondNotificationMailerPreview < ActionMailer::Preview
  def second_notification_email_preview
     SecondNotificationMailer.second_notification_email(Ticket.first)
   end
end
