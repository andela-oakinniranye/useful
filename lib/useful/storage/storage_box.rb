module Useful
  class StorageBox < Base::Storage
    def initialize

    end

    def save
      #code
      super
    end

    def fetch

    end

    def self.connect
      api_key = ENV['BOX_API_KEY']
      api_secret = ENV['BOX_API_SECRET']
      # Dropbox
    end

    def self.fetch_all

    end
  end
end
