class AddFirstNotificationToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :first_notification, :date
  end
end
