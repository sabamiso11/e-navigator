class RemoveUserId < ActiveRecord::Migration[5.1]
  def change
    remove_column :interviews, :user_id
  end
end
