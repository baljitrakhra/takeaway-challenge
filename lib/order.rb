class Order
  attr_reader :takeaway_class, :final_order, :total_price
  
  def initialize(takeaway_class)
    @takeaway_class = takeaway_class
    @final_order = []
    @menu = takeaway_class.menu_class
  end

  def item_selection(no_items, item)
    item_total = item_calculator(no_items, item)
    @final_order << { no_items: no_items, item: item, item_total: item_total }
  end

  def item_calculator(no_items, item)
    price_array = @menu.full_list.select { |x| x[:item] == item }
    item_total = (price_array[0][:price]) * no_items
  end

  def total_calculator
    sum = 0
    total_price = @final_order.each do |hash|
      hash.each do |key,value| 
        if key == :item_total 
          sum += value 
        end  
      end
      @total_price = sum
    end
  end
  
  def verify_order
    final_order.each do |order_line|
      puts
      order_line.each { |_key,value| print " | #{value} | " }
    end
    total_calculator
    "Your total is : #{@total_price}"
  end

end
