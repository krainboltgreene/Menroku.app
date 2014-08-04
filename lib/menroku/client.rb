class Menroku
  class Client
    API_HOST = "https://api.heroku.com/"

    def initialize(token)
      @client = AFMotion::Client.build(API_HOST) do
        request_serializer :json
        header "Accept", "application/vnd.heroku+json; version=3"
        authorization username: "", password: token

        response_serializer :json
      end
      @cache = Cache.new
    end

    def index(endpoint, params = {})
      @cache.fetch("GET #{API_HOST}#{endpoint}") do
        @client.get(endpoint, params) do |result|
          @cache.store("GET #{API_HOST}#{endpoint}", result.object)
        end
        []
      end
    end
  end
end
