class RemoveDLatitudeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :d_latitude, :float
    remove_column :users, :d_longitude, :float
    remove_column :users, :d_name, :string
    remove_column :users, :s_latitude, :float
    remove_column :users, :s_longitude, :float
    remove_column :users, :s_name, :string
  end
end
