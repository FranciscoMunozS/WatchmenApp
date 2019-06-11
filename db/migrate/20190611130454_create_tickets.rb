class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :correlative
      t.integer :memo
      t.date :memo_income_date
      t.integer :ticket_number
      t.bigint :amount
      t.string :currency
      t.date :due_date
      t.string :caution
      t.string :project_name
      t.string :bip
      t.string :departed_office
      t.date :departed_date
      t.string :analist
      t.string :devolution

      t.timestamps
    end
  end
end
