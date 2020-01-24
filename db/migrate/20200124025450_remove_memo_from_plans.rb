class RemoveMemoFromPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :plans, :memo, :text
  end
end
