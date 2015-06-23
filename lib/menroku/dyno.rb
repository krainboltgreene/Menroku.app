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
      [to_name_menu_item, to_state_menu_item, to_command_menu_item]
    end

    def to_state_menu_item
      Menu::Item.new(@state).tap do |item|
        item.indentation = 1
      end
    end

    def to_command_menu_item
      Menu::Item.new(@command).tap do |item|
        item.indentation = 1
      end
    end

    def to_name_menu_item
      Menu::Item.new("#{@name} (#{@size})", "test")
    end
  end
end
