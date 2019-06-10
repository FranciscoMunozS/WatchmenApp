class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :socialreason
      t.string :address
      t.string :phone
      t.string :contact
      t.string :item

      t.timestamps
    end
  end
end
