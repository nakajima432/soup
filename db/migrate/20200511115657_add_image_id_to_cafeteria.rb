class AddImageIdToCafeterias < ActiveRecord::Migration[5.2]
  def change
    add_column :cafeterias, :image_id, :string
  end
end
