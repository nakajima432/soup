class CreateCafeteria < ActiveRecord::Migration[5.2]
  def change
    create_table :cafeteria do |t|
      t.string :name
      t.string :image
      t.text :detail
      t.string :addres
      t.integer :user_id
      t.timestamps
    end
  end
end
