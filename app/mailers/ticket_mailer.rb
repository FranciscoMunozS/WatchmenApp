class TicketMailer < ApplicationMailer
  default from: "soporte@goredelosrios.cl"

  def ticket_mailer
    @ticket = ticket
    mail(to: @ticket.user.email, subject: 'Notificación mensual')
  end
end
