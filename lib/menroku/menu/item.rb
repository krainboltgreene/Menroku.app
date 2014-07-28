class Menroku
  class Menu
    class Item
      NO_KEY = ""

      def initialize(label, action)
        @source = native.new
        @source.title = label
        @source.action = action
      end

      def to_ns
        @source
      end

      def attach(menu)
        @source.setSubmenu(menu)
      end

      def native
        NSMenuItem
      end
      private :native
    end
  end
end
