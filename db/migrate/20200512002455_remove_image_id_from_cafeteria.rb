class RemoveImageIdFromCafeteria < ActiveRecord::Migration[5.2]
  def change
    remove_column :cafeteria, :image_id, :string
  end
end
