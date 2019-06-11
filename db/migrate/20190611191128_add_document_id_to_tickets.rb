class AddDocumentIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :document_id, :integer
  end
end
