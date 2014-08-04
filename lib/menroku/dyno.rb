class Menroku
  class Dyno
    ENDPOINT = "dynos"

    def self.collection(client, app)
      client.index([App::ENDPOINT, app.id, ENDPOINT].join("/")).map do |payload|
        new(client, app, payload)
      end
    end

    attr_reader :name

    def initialize(client, app, payload)
      @client = client
      @app = app
      @payload = payload
      @name = @payload["name"]
    end

    def to_menu_item
      Menu::Item.new(@name)
    end
  end
end
