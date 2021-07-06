class CashRegister

  attr_accessor :total, :discount, :item
  @@all = []

  def initialize(discount=nil)
    @total = 0
    @discount ||= 20
    @@all.clear
  end

  def add_item(item, price, quantity=1)
    @cart = []
    @cart << price * quantity

    @total += price * quantity

    while quantity > 0
      @@all << item
      quantity -= 1
   end

  end

  def apply_discount
    before_disc = @total
    self.total -= (self.total*(@discount.to_f/100)).ceil
    lowered_by = before_disc - total
    lowered_by == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{self.total}."
  end

  def items
    @@all
  end

  def void_last_transaction
    @total -= @cart.last
  end
### END CLASS ###
end
