class AddStateToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :state, :string
  end
end
