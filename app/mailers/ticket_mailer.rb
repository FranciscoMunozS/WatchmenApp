class TicketMailer < ApplicationMailer
  default from: "Sistema registro de garantias"

  def ticket_mailer(user)
    @user = user
    @tickets = Ticket.where("DATE(first_notification) = ?", 'Date.today')

    attachments.inline["mail_box.png"] = File.read("#{Rails.root}/app/assets/images/mail_box.png")
    @tickets.each do |s|
      @user = s
      mail(to: ['ccardenas@goredelosrios.cl', 'cperez@goredelosrios.cl', s.analist.downcase, 'fmunoz@goredelosrios.cl'], subject: 'Notificación mensual')
    end
  end
end
