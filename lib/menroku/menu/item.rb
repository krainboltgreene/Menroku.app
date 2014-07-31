class Menroku
  class Menu
    class Item
      NO_KEY = ""

      def initialize(label, action = NO_KEY)
        @source = native.new
        @source.title = label
        @source.action = action
      end

      def to_ns
        @source
      end

      def attach(menu)
        @source.setSubmenu(menu.to_ns)
      end

      def native
        NSMenuItem
      end
      private :native
    end
  end
end
