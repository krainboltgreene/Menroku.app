class Menroku
  class Client
    class App
      ENDPOINT = "apps"

      def self.collection(client, payloads)
        payloads.map { |payload| new(client, payload) }
      end

      attr_reader :name

      def initialize(client, payload)
        @client = client
        @payload = payload
        @name = payload["name"]
      end
    end
  end
end
