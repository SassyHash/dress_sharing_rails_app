class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :last_name

  end
end
