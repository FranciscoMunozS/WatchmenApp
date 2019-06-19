# Preview all emails at http://localhost:3000/rails/mailers/new_record_mailer
class NewRecordMailerPreview < ActionMailer::Preview
  def new_record_preview
    NewRecordMailer.new_record_email(Ticket.first)
  end
end
