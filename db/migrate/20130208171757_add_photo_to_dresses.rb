class AddPhotoToDresses < ActiveRecord::Migration
  def change
    add_column :dresses, :photo_blob, :binary
  end
end
