module Useful
  class Item
    attr_accessor :item, :discount, :tax
    attr_reader :quantity, :price, :subtotal, :total
    def initialize item = nil
      @discount = 0
      @tax = 0
      set_attr item #unless item.nil?
    end

    def item=(item)
      set_attr item
    end

    def set_attr item
      @item = item || Hash.new(0)
      @quantity = @item[:quantity] || @item.quantity
      @price = @item[:price] || @item.price

    end

    def subtotal
      @subtotal= quantity * price
    end

    def percentage(percent)
      (@subtotal * percent) / 100.0
    end

    def percent_value(value)
      divisor = @subtotal == 0 ? 1 : @subtotal
      (value * 100.0) / divisor
    end

    def tax(percent = nil)
      unless percent.nil?
        percentage(percent)
      else
        percent_value(@tax)
      end
    end

    def discount(percent = nil)
      unless percent.nil?
        percentage(percent)
      else
        percent_value(@discount)
      end
      # percentage(percent)
    end

    # def add_discount(percent)
    #   percentage(percent)
    # end
    #
    # def add_tax(percent)
    #   percentage(percent)
    # end


  end
end
