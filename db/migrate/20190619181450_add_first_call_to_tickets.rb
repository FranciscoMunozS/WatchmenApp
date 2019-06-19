class AddFirstCallToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :first_call, :integer
  end
end
