class FirstNotificationMailer < ApplicationMailer
  default from: "no-reply@goredelosrios.cl"

  def first_notification_email(ticket)
    @ticket = ticket
    mail(to: @ticket.analist, subject: "Aviso vencimiento registro garantia")
  end
end
