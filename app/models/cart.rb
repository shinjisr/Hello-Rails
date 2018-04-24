class Cart
  attr_reader :items # Let it be easier to access item parameters

  # Set default items to be an empty array
  def initialize(items = [])
    @items = items
  end

  def add_item(product_id)
    # 比對 Cart 內是否已存在現在要加入的 item ? fund_item become a boolean value
    found_item = items.find { |item| item.product_id == product_id }

    if found_item                        # If there is already has same items,
      found_item.increment               # increase the quantity of that.
    else
      @items << CartItem.new(product_id) # Else, use model CartItem to wrap new items, then add to array @items.
    end
  end

  def empty?
    @items.empty?
  end

  # 利用 ruby 內建的 reduce 方法計算車內總金額
  def total_price
    items.reduce(0) { |sum, item| sum + item.price }
  end

  # 計算車內折扣後的金額
  def total_price_with_discount(percent)
    total_price * percent
  end


  # 用 .map 方法優雅的轉成雜湊 hash 陣列格式
  def serialize
    all_items = items.map{ |item|
      { "product_id" => item.product_id, "quantity" => item.quantity}
    }

    { "items" => all_items }
  end

  # 將收到的 hash 轉成 array
  def self.from_hash(hash)
    # 判斷 hash 是否為空值？ 是的話 new 一個空 array 讓
    if hash.nil?
      new []
    else
      # 以 map 方法， |item_hash| 將每個元素提出來， 令 item_hash
      new hash["items"].map { |item_hash|
        # 每一個 item_hash 都用 "key" 取出其值, 包成一件 CartItem(product_id, quantity)
        CartItem.new(item_hash["product_id"], item_hash["quantity"])
      }
    end
  end
end
