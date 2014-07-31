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
    end

    def index(endpoint, default, params = {})
      @client.get(endpoint, params) do |result|
        @response ||= result.object
      end
      @response || default
    end
  end
end
