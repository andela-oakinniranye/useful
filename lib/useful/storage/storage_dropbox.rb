module Useful
  class StorageDropbox < Base::Storage
    @@connection_key
    def initialize

    end

    def save
      #code
    end

    def fetch

    end

    def self.connect
      api_key = ENV['DROPBOX_API_KEY']
      api_secret = ENV['DROPBOX_API_SECRET']
      # Dropbox
    end

    def self.fetch_all

    end
  end
end
