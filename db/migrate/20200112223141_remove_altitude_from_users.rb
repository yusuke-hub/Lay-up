class RemoveAltitudeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :altitude, :integer
  end
end
