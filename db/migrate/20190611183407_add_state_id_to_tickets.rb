class AddStateIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :state_id, :integer
  end
end
