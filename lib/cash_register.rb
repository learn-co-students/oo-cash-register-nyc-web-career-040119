require 'pry'
class CashRegister

  def initialize(percent_off = 0)
    @total = 0
    @discount = percent_off
    @cart = []
  end

  def discount
    @discount
  end

  def total=(total)
    @total = total
  end

  def total
    @total
  end



  def add_item(title,price,quantity = 1)
    @last_item_price = price
    @total += price * quantity
    quantity.times do
      @cart << title
    end
  end


  def apply_discount
    #binding.pry
    if @discount > 0
      discount = @total * (@discount/100.0)
      @total = @total - discount
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    @total = @total - @last_item_price
  end


end