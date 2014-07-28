class Menroku
  class Client
    class Dyno
      ENDPOINT = "dynos"

      def self.collection(client, payloads)
        payloads.map { |payload| new(client, payload) }
      end

      attr_reader :name

      def initialize(client, payload)
        @client = client
        @payload = payload
      end
    end
  end
end
