class TicketMailer < ApplicationMailer
  default from: "soporte@goredelosrios.cl"

  def ticket_mailer(user)
    @user = user
    @tickets = Ticket.all

    attachments.inline["mail_box.png"] = File.read("#{Rails.root}/app/assets/images/mail_box.png")
    @tickets.each do |s|
      @user = s
      mail(to: 'franciscomuniozs@gmail.com', subject: 'Notificación mensual')
    end
  end
end
