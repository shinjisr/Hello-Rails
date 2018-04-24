class CreateWareHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :ware_houses do |t|
      t.references :store, foreign_key: true # foreign_key = 外部鍵 用來對應到 Store's id
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
