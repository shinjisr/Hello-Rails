require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "購物車基本功能" do
    it " 可以把商品放進購物車，然後購物車就有東西了 " do
      cart = Cart.new                            # 新增一台購物車
      cart.add_item 1                            # 丟個東西到購物車裡
      expect(cart.empty?).to be false            # 它不應該是空的
    end
    it " 如果加了相同種類的商品，購買項目(CartItem)不會增加，但商品數量會改變 " do
      cart = Cart.new                            # 新增一台購物車
      3.times { cart.add_item(1)}                # 買了 3 次 1
      5.times { cart.add_item(2)}                # 買了 5 次 2
      2.times { cart.add_item(3)}                # 買了 2 次 3

      expect(cart.items.length).to be 3          # 總共有 3 個 item
      expect(cart.items.first.quantity).to be 3  # 第 1 個 item 的數量會是 3
      expect(cart.items.second.quantity).to be 5 # 第 2 個 item 的數量會是 5
    end
    it " 商品可以放進購物車，也可以再拿出來 " do
      cart = Cart.new                                # 創造一台空 Cart
      p1 = Merchandise.create(title:" 浪人劍客 ")     # 建立商品 1 in Merchandises table
      p2 = Merchandise.create(title:" 冒險野郎 ")     # 建立商品 2 in Merchandises table

      4.times { cart.add_item(p1.id) }           # 加入 4 次商品 1, 用 CartItem 包裝 Merchandise
      2.times { cart.add_item(p2.id) }           # 加入 2 次商品 2

      expect(cart.items.first.product_id).to be p1.id # 第 1 個 item 的商品 id 應該等於商品 1 的 id
      expect(cart.items.second.product_id).to be p2.id # 第 2 個 item 的商品 id 應該等於商品 2 的 id
      expect(cart.items.first.merchandise).to be_a Merchandise # 第 1 個 item 拿出來的東西應該是一種商品
    end
  end

  describe "購物車進階功能" do
    it " 可以將購物車內容轉換成 Hash，存到 Session 裡 " do
      cart = Cart.new
      3.times{ cart.add_item(2) } # 增加商品 id 2, 3 次
      4.times{ cart.add_item(5) } # 增加商品 id 5, 4 次

      expect(cart.serialize).to eq session_hash
    end
    it " 可以把 Session 的內容（Hash 格式），還原成購物車的內容 " do
      # Use .from_hash method to 1. put session_hash into an new array,
      # 2. turn it into an new arry
      cart = Cart.from_hash(session_hash)

      expect(cart.items.first.product_id).to be 2
      expect(cart.items.first.quantity).to be 3
      expect(cart.items.second.product_id).to be 5
      expect(cart.items.second.quantity).to be 4
    end
  end

  private
  def session_hash
    {
      "items" => [
        {"product_id" => 2, "quantity" => 3},
        {"product_id" => 5, "quantity" => 4}
      ]
    }
  end
end
