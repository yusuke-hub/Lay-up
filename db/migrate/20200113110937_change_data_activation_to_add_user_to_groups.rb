class ChangeDataActivationToAddUserToGroups < ActiveRecord::Migration[5.2]
  def change
  	change_column :add_user_to_groups, :activation, :boolean, default: false, null: false
  end
end
