class AddBankIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :bank_id, :integer
  end
end
