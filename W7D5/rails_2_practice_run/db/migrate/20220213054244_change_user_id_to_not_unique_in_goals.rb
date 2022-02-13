class ChangeUserIdToNotUniqueInGoals < ActiveRecord::Migration[5.2]
  def change
    remove_column :goals, :user_id
    add_column :goals, :user_id, :integer
    add_index :goals, :user_id
  end
end
