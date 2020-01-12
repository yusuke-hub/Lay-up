class AddColumnAltitude < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :altitude, :integer
  end
end
