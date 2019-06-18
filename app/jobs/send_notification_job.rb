class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    @ticket = ticket
    FirstNotificationMailer.first_notification_email(@ticket).deliver_later
  end
end
