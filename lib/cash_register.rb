require 'pry'
class CashRegister
  attr_accessor :discount, :add_item, :total

  def initialize(discount = nil)
  @total = 0
  @discount = discount
  @cart = []
  end

  def add_item(name , price, quantity = 1)
  @name = name
  @price = price
  @quantity = quantity
  @total += price * quantity
    quantity.times do
    @cart << name
    end
  end

  def apply_discount
    #binding.pry
    if discount == nil
      "There is no discount to apply."
    else
      @total -= @total*(@discount/100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @cart
  end

  def void_last_transaction
    #binding.pry
    @total -= @price *@quantity
  end




end
