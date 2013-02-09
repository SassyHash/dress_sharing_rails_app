class CreateDresses < ActiveRecord::Migration
  def change
    create_table :dresses do |t|
      t.integer :owner_id
      t.string :brand
      t.string :size
      t.string :color
      t.text :notes
      t.integer :rent
    end
  end
end
