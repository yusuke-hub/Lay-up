class RemoveDLatitudeFromPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :plans, :d_latitude, :float
    remove_column :plans, :d_longitude, :float
    remove_column :plans, :d_name, :string
    remove_column :plans, :s_latitude, :float
    remove_column :plans, :s_longitude, :float
    remove_column :plans, :s_name, :string
    remove_column :plans, :altitude, :integer
  end
end
