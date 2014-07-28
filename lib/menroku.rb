require "base64"

class Menroku
  require_relative "menroku/menu"
  require_relative "menroku/status_bar"
  require_relative "menroku/client"
  require_relative "menroku/app"

  def initialize
    @item = StatusBar.new(self.class.name)
    @menu = Menu.new
    @client = Client.new("e0373389-154c-49ce-b38e-664793520400")

    @item.attach(@menu)

    @client.apps do |app|
      App.new(app, @menu)
    end
  end

  def menu
    @menu.to_ns
  end

  def item
    @item.to_ns
  end
end
