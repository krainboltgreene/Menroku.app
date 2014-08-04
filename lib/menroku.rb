require "base64"

class Menroku
  require_relative "menroku/client"
  require_relative "menroku/app"
  require_relative "menroku/dyno"
  require_relative "menroku/status_bar"
  require_relative "menroku/menu"

  def initialize(name, token)
    @status_bar = StatusBar.new(name)
    @client = Client.new(token)
  end

  def to_menu
    Menu.new.tap do |menu|
      @apps.each do |app|
        menu.attach(app.to_menu_item)
      end
    end
  end

  def to_ns
    BW::Reactor.add_periodic_timer(1) do
      @status_bar.attach(to_menu)
    end
  end
end
