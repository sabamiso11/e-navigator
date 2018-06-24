class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :start_interview
      t.integer :state, null: false, default: 0
      t.timestamps
      t.references :interviews, :user, index: true
    end
  end
end
