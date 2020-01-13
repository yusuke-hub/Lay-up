class RenameAddUserToGroupToBelongings < ActiveRecord::Migration[5.2]
  def change
  	rename_table :add_user_to_groups, :belongings
  end
end
