class Menroku
  class App
    def initialize(model, menu)
      @model = model
      @menu = menu

      @menu.attach(Menu::Item.new(label, "foo"))
    end

    def label
      "#{@model}:#{state}"
    end

    def state
      if @model.up?
        "up"
      else
        "down"
      end
    end
  end
end
