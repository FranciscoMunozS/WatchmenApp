class AddRutToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :rut, :string
  end
end
