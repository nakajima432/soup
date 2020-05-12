class ChangeCafeteriaToTrashCafeterias < ActiveRecord::Migration[5.2]
  def change
    rename_table :cafeteria, :cafeterias
  end
end
