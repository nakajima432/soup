class RemoveImageFromCafeterias < ActiveRecord::Migration[5.2]
  def change
    remove_column :cafeterias, :image, :string
  end
end
