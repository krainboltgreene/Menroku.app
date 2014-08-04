class Menroku
  class Dyno
    ENDPOINT = "dynos"
    UP_STATE = "up"
    IDLE_STATE = "idle"

    def self.collection(client, app)
      client.index([App::ENDPOINT, app.id, ENDPOINT].join("/")).map do |payload|
        new(client, app, payload)
      end
    end

    attr_reader :name
    attr_reader :size
    attr_reader :state
    attr_reader :command

    def initialize(client, app, payload)
      @client = client
      @app = app
      @payload = payload
      @name = @payload["name"]
      @size = @payload["size"]
      @state = @payload["state"]
      @command = @payload["command"]
    end

    def available?
      @state == UP_STATE || @state == IDLE_STATE
    end

    def sleeping?
      @state == IDLE_STATE
    end

    def to_menu_item
      Menu::Item.new(to_label, "test").tap do |item|
        item.indentation = 1
      end
    end

    def to_label
      "#{size} - #{state}: #{name}"
    end
  end
end
