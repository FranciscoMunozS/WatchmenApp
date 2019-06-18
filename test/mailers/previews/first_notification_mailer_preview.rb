# Preview all emails at http://localhost:3000/rails/mailers/first_notification_mailer
class FirstNotificationMailerPreview < ActionMailer::Preview
  def first_notification_email_preview
     FirstNotificationMailer.first_notification_email(Ticket.first)
   end
end
