
class CashRegister

  def total
    @total
  end

  def discount
    @discount
  end

  def items
    @items
  end

  def last_item
    @last_item
  end

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @last_item = []
  end

  def total=(total)
    @total = total
  end

  def add_item(item, price, quantity=1)
    @total += price*quantity
    quantity.times{@items << item}
    @last_item = [item, price, quantity]
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= @total*@discount/100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total -= @last_item[1]*@last_item[2]
    @items.pop
  end

end
