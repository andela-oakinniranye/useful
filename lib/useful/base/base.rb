module Useful
  module Base
    attr_reader :access_token, :client_id, :client_secret
    # @@connection_key
    # def self.connection_key(api_key, api_secret)
    #   @@connection_key= {api_key: api_key, api_secret: api_secret}
    # end

    # def self.connect(api_key, api_secret)
    #   # implement API connection
    # end

    # https://app.box.com/api/oauth2/authorize?response_type=code&client_id=YOUR_CLIENT_ID&redirect_uri=YOUR_REDIRECT_URI&state=security_token%3DKnhMJatFipTAnM0nHlZA
    # def connect
    #
    #   # @@connection = Faraday.new(url: self.class.const_get(:API_URL))
    # end

    def client(access_token=ENV["#{self::CLASS_NAME}_ACCESS_TOKEN"])
      @@connection ||= Faraday.new(url: self::API_URL)
      raise ArgumentError, "You need to set ENV['#{self::CLASS_NAME}_ACCESS_TOKEN'] with your access_token from Box \n Register at https://www.box.com/developers/services" unless access_token
      @@connection
    end

    def upload_client(access_token=ENV["#{self::CLASS_NAME}_ACCESS_TOKEN"])
      @@upload_connection ||= Faraday.new(url: self::UPLOAD_URL) do |conn|
        conn.request :multipart
        conn.request :url_encoded
        conn.adapter :net_http
      end
      raise ArgumentError, "You need to set ENV['#{self::CLASS_NAME}_ACCESS_TOKEN'] with your access_token from Box \n Register at https://www.box.com/developers/services" unless access_token
      @@upload_connection
    end
  end
end
