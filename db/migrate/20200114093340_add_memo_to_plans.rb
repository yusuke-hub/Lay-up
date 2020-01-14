class AddMemoToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :memo, :text
  end
end
