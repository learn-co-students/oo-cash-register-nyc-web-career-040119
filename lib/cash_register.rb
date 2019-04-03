class CashRegister
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  attr_accessor :total
  attr_reader :discount, :items

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    @last_transaction = price * quantity
    quantity.times do
      @items << item
    end
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total *= 1.0 - discount/100.0
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end
