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
   
      create_join_table :carts, :items do |t|
        # t.index [:cart_id, :item_id]
        # t.index [:item_id, :cart_id]
      end
     
    end
end
