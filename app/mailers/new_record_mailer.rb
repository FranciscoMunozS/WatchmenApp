class NewRecordMailer < ApplicationMailer
  default from: 'Sistema registro de garantias'

  def new_record_email(ticket)
    @ticket = ticket
    attachments.inline["mail_sent.png"] = File.read("#{Rails.root}/app/assets/images/mail_sent.png")
    mail(to: @ticket.analist, subject: 'Nuevo registro de garantia')
  end
end
