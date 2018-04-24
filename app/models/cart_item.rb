class CartItem
  # 供外部讀取 product_id, quantity
  attr_reader :product_id, :quantity

  # new 一個 CartItem 時順便傳入 product_id, quantity 預設值為 1
  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end

  # quantity of increment method default to 1
  def increment(n = 1)
    @quantity += n
  end

  # Search product_id in Merchandises table
  def merchandise
    Merchandise.find_by(id: product_id)
  end

  # 因為目前每個 item 本身都可以知道對應到的商品以及數量，所以只要一行即可算出此項目的價錢
  def price
    merchandise.price * quantity
  end

  # 以下我自己加的測試看看 => it works!
  def price_with_discount(percent)
    price * percent
  end

end