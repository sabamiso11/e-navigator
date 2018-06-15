class AddInterviews < ActiveRecord::Migration[5.1]
  def change
    add_column :interviews, :user_id, :bigint
  end
end
