require "base64"

class Menroku
  require_relative "menroku/client"
  require_relative "menroku/cache"
  require_relative "menroku/app"
  require_relative "menroku/dyno"
  require_relative "menroku/status_bar"
  require_relative "menroku/menu"

  def initialize(name, token)
    @status_bar = StatusBar.new(name)
    @client = Client.new(token)
  end

  def to_menu
    Menu.new do |menu|
      App.collection(@client).each do |app|
        menu.attach(app.to_menu_item)
      end
      if menu.empty?
        menu.attach(Menu::Item.new("Heroku hasn't responded", ""))
      end
    end
  end

  def to_ns
    BW::Reactor.add_periodic_timer(1) do
      @status_bar.attach(to_menu)
    end
  end
end
