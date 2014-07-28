class Menroku
  class Menu
    require_relative "menu/item"

    def initialize
      @source = native.new
    end

    def to_ns
      @source
    end

    def attach(item)
      @source.addItem(item.to_ns)
    end

    def native
      NSMenu
    end
    private :native
  end
end
