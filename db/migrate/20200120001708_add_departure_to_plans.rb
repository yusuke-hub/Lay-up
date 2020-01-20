class AddDepartureToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :departure, :string
    add_column :plans, :shelter, :string
    add_column :plans, :duration, :integer
  end
end
