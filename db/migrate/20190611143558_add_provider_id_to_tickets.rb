class AddProviderIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :provider_id, :integer
  end
end
