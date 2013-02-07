class AddIndexToDresses < ActiveRecord::Migration
  def change
    add_index :dresses, :size
    add_index :dresses, :rent
    add_index :dresses, :owner_id
  end
end
