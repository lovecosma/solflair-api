class CreateCartsAndItems < ActiveRecord::Migration[6.0]
    def change
      create_table :carts do |t|
        t.integer :total
        t.timestamps
      end
   
      create_table :items do |t|
        t.string :name
        t.float :price
        t.timestamps
      end
   
      create_table :carts_items, id: false do |t|
        t.belongs_to :cart
        t.belongs_to :item
      end
    end
end
