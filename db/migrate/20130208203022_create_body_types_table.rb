class CreateBodyTypesTable < ActiveRecord::Migration
  def change
    create_table :body_types do |t|
      t.string :label
    end
  end
end
