class SendSecondNotificationJob < ApplicationJob
  queue_as :default

  def perform(ticket)
    @ticket = ticket

    SecondNotificationMailer.second_notification_email(@ticket).deliver_later
  end
end
