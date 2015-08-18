module Useful
  module Base
    @@connection_key
    def self.connection_key(api_key, api_secret)
      @@connection_key= {api_key: api_key, api_secret: api_secret}
    end

    def self.connect(api_key, api_secret)
      # implement API connection
    end
  end
end
