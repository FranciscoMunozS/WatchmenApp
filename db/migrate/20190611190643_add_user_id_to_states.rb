class AddUserIdToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :user_id, :integer
  end
end
