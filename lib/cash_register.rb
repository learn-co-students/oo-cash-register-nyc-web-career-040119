require 'pry'
class CashRegister
    attr_accessor :discount, :total, :title, :last_transaction
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = []
    end

   
    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @last_transaction = [title, price, quantity ]
        @items.push(title.split * quantity)
    end

    def apply_discount
        if @discount > 0
            @total -=  @total * discount / 100.to_f
            "After the discount, the total comes to $800."
        else 
            "There is no discount to apply."
        end
    end 

    def items
        # binding.pry
        @items.flatten
    end 

    def void_last_transaction
        @total -= @last_transaction[1]
    end 
end

