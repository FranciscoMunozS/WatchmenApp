class TicketMailer < ApplicationMailer
  default from: "soporte@goredelosrios.cl"

  def ticket_mailer
    @ticket = ticket
    mail(to: 'franciscomuniozs@gmail.com', subject: 'Notificación mensual')
  end
end
