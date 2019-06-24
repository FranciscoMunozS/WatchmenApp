class FirstNotificationMailer < ApplicationMailer
  default from: "no-reply@goredelosrios.cl"

  def first_notification_email(ticket)
    @ticket = ticket
    attachments.inline["opened_email.png"] = File.read("#{Rails.root}/app/assets/images/opened_email.png")
    mail(to: @ticket.analist, subject: "Aviso vencimiento registro garantia")
  end
end
