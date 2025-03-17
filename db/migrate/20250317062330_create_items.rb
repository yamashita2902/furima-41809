class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name,       null: false
      t.text :explanation , null: false 
      t.integer :price,   null: false 
      t.references :user , null: false, foreign_key: true
      t.integer :category_id, null: false 
      t.integer :situation_id, null: false
      t.integer :prefecture_id, null: false 
      t.integer :arrivesday_id, null: false 
      t.integer :deliverystyle_id, null: false 
      t.timestamps
    end
  end
end
