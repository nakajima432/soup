class AddImageToCafeteria < ActiveRecord::Migration[5.2]
  def change
    add_column :cafeteria, :image, :string
  end
end
