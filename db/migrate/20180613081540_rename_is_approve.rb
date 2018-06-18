class RenameIsApprove < ActiveRecord::Migration[5.1]
  def change
    rename_column :interviews, :isApproval, :state
    change_column :interviews, :state, :'integer USING CAST(state AS integer)', null: false, default: 0
  end
end
