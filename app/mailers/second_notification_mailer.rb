class SecondNotificationMailer < ApplicationMailer
  default from: "soporte@goredelosrios.cl"

  def second_notification_email(ticket)
    @ticket = ticket
    attachments.inline["opened_email.png"] = File.read("#{Rails.root}/app/assets/images/opened_email.png")
    mail(to: @ticket.analist, subject: "Segunda notificación por vencimiento")
  end
end
