class ChangeCafeteriasToCafeteria < ActiveRecord::Migration[5.2]
  def change
    rename_table :cafeterias, :cafeteria
  end
end
