class AddAltitudeToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :altitude, :integer
  end
end
