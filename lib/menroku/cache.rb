class Menroku
  class Cache
    DEFAULT_EXPIRATION_TIME = 300

    def initialize
      @store = {}
    end

    def fetch(key)
      if exists?(key)
        @store[key][:data]
      else
        yield
      end
    end

    def store(key, value)
      if cached?(key)
        @store[key][:data]
      else
        @store[key] = { data: value, timestamp: Time.now }
      end
    end

    def cached?(key)
      exists?(key) && expired?(@store[key])
    end

    def exists?(key)
      @store.keys.include?(key)
    end

    def expired?(store)
      (Time.now - DEFAULT_EXPIRATION_TIME) > store[:timestamp]
    end
  end
end
