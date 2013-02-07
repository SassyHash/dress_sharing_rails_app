class AddIndexToRentals < ActiveRecord::Migration
  def change
    add_index :rentals, :dress_id
    add_index :rentals, :user_id
  end
end
