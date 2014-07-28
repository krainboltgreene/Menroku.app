class Menroku
  class Client
    require_relative "client/app"
    API_HOST = "https://api.heroku.com/"

    def initialize(token)
      @client = AFMotion::Client.build(API_HOST) do
        header "Accept", "application/vnd.heroku+json; version=3"
        authorization username: "", password: "#{token}\n"
        response_serializer :json
      end
    end

    def apps(&block)
      @client.get(App::ENDPOINT) do |result|
        App.collection(self, result.object).each(&block)
      end
    end

    def dynos(app, &block)
      @client.get([App::ENDPOINT, app.id, Dyno::ENDPOINT].join("/")) do |result|
        Dyno.collection(self, app, result.object).each(&block)
      end
    end
  end
end
