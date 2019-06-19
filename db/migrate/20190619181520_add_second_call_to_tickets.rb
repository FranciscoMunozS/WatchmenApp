class AddSecondCallToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :second_call, :integer
  end
end
