class Menroku
  class StatusBar
    def initialize(name)
      @name = name
      @source = native
      @item = @source.statusItemWithLength(NSVariableStatusItemLength).init

      @item.setHighlightMode(true)
      @item.setImage(NSImage.imageNamed("Icon.png"))
    end

    def attach(menu)
      @item.setMenu(menu.to_ns)
    end

    def native
      NSStatusBar.systemStatusBar
    end
    private :native
  end
end
