class AddRefUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :interviews, :user, index: true
  end
end
