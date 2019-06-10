class AddUserIdToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :providers, :user_id, :integer
  end
end
