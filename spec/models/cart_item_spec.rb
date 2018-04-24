require 'rails_helper'

RSpec.describe CartItem, type: :model do
    it " 每個 Cart Item 都可以各自計算金額 " do
      p1 = Merchandise.create(title:" 浪人劍客 ", price: 80)  # 建立商品 1
      p2 = Merchandise.create(title:" 冒險野郎 ", price: 200) # 建立商品 2

      cart = Cart.new
      3.times { cart.add_item(p1.id) }  # 加 3 次商品 1
      4.times { cart.add_item(p2.id) }  # 加 4 次商品 2
      2.times { cart.add_item(p1.id) }  # 再加 2 次商品 1

      expect(cart.items.first.price).to be 400  # 第 1 項 Cart item 的價格應該是 400 元
      expect(cart.items.second.price).to be 800 # 第 2 項 Cart item 的價格應該是 800 元
    end
    it " 可以計算整台購物車的總消費金額 " do
      cart = Cart.new

      p1 = Merchandise.create(title:" 浪人劍客 ", price: 80)    # 建立商品 1
      p2 = Merchandise.create(title:" 冒險野郎 ", price: 200)   # 建立商品 2

      3.times{
        cart.add_item(p1.id)
        cart.add_item(p2.id)
      }

      expect(cart.total_price).to be 840
    end
    it " 特別活動可能可搭配折扣（例如聖誕節全面打9折，或滿額滿千送百）" do
      cart = Cart.new
      p1 = Merchandise.create(title:" 浪人劍客 ", price: 100)
      p2 = Merchandise.create(title:" 冒險野狼 ", price: 200)

      2.times {
        cart.add_item(p1.id)
        cart.add_item(p2.id)
      }
      expect(cart.total_price_with_discount(0.9).round).to be 540
    end
end
