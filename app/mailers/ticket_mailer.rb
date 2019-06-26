class TicketMailer < ApplicationMailer
  default from: "Sistema registro de garantias"

  def ticket_mailer(user)
    @user = user
    @tickets = Ticket.all

    attachments.inline["mail_box.png"] = File.read("#{Rails.root}/app/assets/images/mail_box.png")
    @tickets.each do |s|
      @user = s
      mail(to: ['ccardenas@goredelosrios.cl', 'fmunoz@goredelosrios.cl'], subject: 'Notificación mensual')
    end
  end
end
