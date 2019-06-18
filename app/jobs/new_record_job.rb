class NewRecordJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    @ticket = ticket
    NewRecordMailer.new_record_email(@ticket).deliver_later
  end
end
