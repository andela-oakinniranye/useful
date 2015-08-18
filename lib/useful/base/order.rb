module Useful
  class Order
    attr_reader :item
    @@orders = []

    # def initialize
    # end

    # def add
    #   self.add @item
    # end

    class << self
      def orders
        @@orders
      end

      def add(item)
        @item = item
        @@orders << @item if item.is_a? Item
      end

      def remove(item_or_id)
        @@orders.delete(item_or_id) if item_or_id.is_a? Item
        @@orders.delete_at(item_or_id) if item_or_id.is_a? Integer
      end

      def subtotal
        subtotal = 0
        @@orders.each { |item| subtotal += item.subtotal }
        subtotal
      end

      # def

      #implement tax-deductible total method
      def total
        subtotal
      end
    end
  end
end
