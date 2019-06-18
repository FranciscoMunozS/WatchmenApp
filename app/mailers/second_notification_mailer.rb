class SecondNotificationMailer < ApplicationMailer
  default from: "soporte@goredelosrios.cl"

  def second_notification_email(ticket)
    @ticket = ticket
    mail(to: @ticket.analist, subject: "Segunda notificación por vencimiento")
  end
end
