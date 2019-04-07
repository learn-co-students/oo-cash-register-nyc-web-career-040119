class CashRegister
  attr_accessor :total, :discount, :last_transaction_amount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction_amount = 0
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    if quantity > 1
      i = 0
      while i < quantity
        @items << title
        @total += price
        i += 1
      end
    else
      @items << title
      @total += price
    end
    @last_transaction_amount = @total
  end

  def apply_discount
    if @discount > 0
      discount_float = @discount/100.to_f

      @total = @total - (@total * discount_float)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction_amount
  end


end
