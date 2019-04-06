
require 'pry'

class CashRegister


  attr_accessor :discount, :total, :price, :transaction

  def initialize (discount = 0)
    @total = 0
    @discount = discount
    @item = []
  end

  def add_item (title, price, quantity = 1)
    # total price
    @total += price * quantity

    # item list
    quantity.times do
      @item << title
    end

    # LAST transaction
    @transaction = price * quantity


  end

  def apply_discount
    if @discount > 0
      @total = @total * 0.80 # 20% discount
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item
  end
  # binding.pry

  def void_last_transaction
    @total = @total - @transaction
  end
end
