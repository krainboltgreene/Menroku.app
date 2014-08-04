class Menroku
  class App
    ENDPOINT = "apps"

    def self.collection(client)
      client.index(ENDPOINT).map do |payload|
        new(client, payload)
      end
    end

    attr_reader :name

    def initialize(client, payload)
      @client = client
      @payload = payload
      @id = payload["id"]
      @name = payload["name"]
      @dynos = Dyno.collection(@client, self)
    end

    def to_menu
      Menu.new.tap do |menu|
        @dynos.each do |dyno|
          menu.attach(dyno.to_menu_item)
        end
      end
    end

    def to_menu_item
      Menu::Item.new(@name).tap do |item|
        item.attach(to_menu)
      end
    end
  end
end
