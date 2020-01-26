class RemoveSituationIdFromPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :plans, :situation_id, :integer
  end
end
