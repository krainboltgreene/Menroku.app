class Menroku
  class Menu
    require_relative "menu/item"

    def initialize(&block)
      @source = native.new
      @items = []
      tap(&block)
    end

    def to_ns
      @source.tap do |source|
        @items.each { |item| @source.addItem(item.to_ns) }
      end
    end

    def attach(item)
      if item.respond_to?("each")
        item.each { |i| @items << i }
      else
        @items << item
      end
    end

    def empty?
      @items.empty?
    end

    def native
      NSMenu
    end
    private :native
  end
end
