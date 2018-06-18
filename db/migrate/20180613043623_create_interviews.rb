class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :start_interview
      t.boolean :isApproval
      t.timestamps
    end
  end
end
