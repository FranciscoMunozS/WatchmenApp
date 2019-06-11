class AddUserIdToBanks < ActiveRecord::Migration[5.2]
  def change
    add_column :banks, :user_id, :integer
  end
end
