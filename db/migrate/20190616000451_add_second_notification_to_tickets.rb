class AddSecondNotificationToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :second_notification, :date
  end
end
