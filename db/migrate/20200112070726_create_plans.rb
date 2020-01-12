class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.integer :user_id
      t.integer :situation_id
      t.float :d_latitude
      t.float :d_longitude
      t.string :d_name
      t.float :s_latitude
      t.float :s_longitude
      t.string :s_name
      t.integer :distance

      t.timestamps
    end
  end
end
