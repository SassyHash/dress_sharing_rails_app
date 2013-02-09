class CreateBodyTypeDressesTable < ActiveRecord::Migration
  def change
    create_table :body_type_dresses do |t|
      t.integer :dress_id
      t.integer :body_type_id
    end
  end
end

