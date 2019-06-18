class NewRecordMailer < ApplicationMailer
  default from: 'soporte@goredelosrios.cl'

  def new_record_email(ticket)
    @ticket = ticket
    mail(to: @ticket.user.email, subject: 'Nuevo registro de garantia')
  end
end
