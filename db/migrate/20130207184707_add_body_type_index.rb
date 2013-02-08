class AddBodyTypeIndex < ActiveRecord::Migration
  def change
    add_index :dresses, :body_type

  end

end
