class ChangeDataAccountIdToUser < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :account_id, :string
  end
end
