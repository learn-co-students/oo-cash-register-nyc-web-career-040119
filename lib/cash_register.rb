require 'pry'

class CashRegister
  attr_accessor :total, :items
  attr_reader :discount

  def initialize(*discount)
    @total = 0
    @discount = discount.join.to_i
    @items = []
  end

  def add_item(title, price, *quantity)
    @price = price

    if quantity.empty?
      @items << title
      quantity = 1
      @price *= quantity
      @total += @price
    else
      quantity = quantity.join.to_i
      @items << [title] * quantity
      @price *= quantity
      @total += @price
    end
  end

  def apply_discount
    if @discount > 0
      @total -= @total * @discount/100.to_f
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items.flatten
  end

  def void_last_transaction
    @items.pop
    @total -= @price
  end
end
