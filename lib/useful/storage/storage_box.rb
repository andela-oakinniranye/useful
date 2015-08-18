module Useful
  class StorageBox < Base::Storage
    extend Base
    # AUTH_URL = 'https://app.box.com/api/oauth2/authorize?response_type=code&client_id=MY_CLIENT_ID&state=security_token%3DKnhMJatFipTAnM0nHlZA'

  #     Set your ENV variable to use this application
  #       Variables to set:
  #         access_token=ENV['BOX_ACCESS_TOKEN'],
  #         client_id: ENV['BOX_CLIENT_ID'],
  #         client_secret: ENV['BOX_CLIENT_SECRET']
  #     OR
  #       initialize with these params
  #         StorageBox.new(access_token, client_id, client_secret)
  #
    API_VERSION = 2.0
    API_URL = "https://api.box.com/#{API_VERSION}"
    FOLDER_URL = "#{API_URL}/folders"
    FILES_URL = "#{API_URL}/files"
    UPLOAD_URL = "https://upload.box.com/api/#{API_VERSION}"
    FILES_UPLOAD_URL = "#{UPLOAD_URL}/files/content"
    CLASS_NAME = "BOX"

    @@files = {}



    def initialize(
                  access_token=ENV['BOX_ACCESS_TOKEN'],
                  client_id: ENV['BOX_CLIENT_ID'],
                  client_secret: ENV['BOX_CLIENT_SECRET']
                  )
      @access_token = access_token
      @client_secret = client_secret
      @client_id = client_id
    end

    def self.set_header(connection)
      connection.headers = { 'Authorization' => "Bearer #{ENV['BOX_ACCESS_TOKEN']}" }
      connection
    end

    def self.connect
      set_header(client)
    end

    def self.connect_for_upload
      set_header(client)
    end


    def add_file

    end

    def save
      #code
      # super
    end


    def fetch(file: nil, folder: nil )
      binding.pry
      if folder
        folder_url = FOLDER_URL + '/' + folder
        response = self.class.connect.get(folder_url)

      elsif file
        file_url = FILES_URL + '/' + file
        response = self.class.connect.get(file_url)
      # else

      end
      # JSON.parse(response.body)
    end

    def add_file(file_location, folder_id)
      response = self.class.connect_for_upload.post
    end

    def self.fetch_all
      connection = client(FOLDER_URL, access_token: ENV['BOX_ACCESS_TOKEN'])
      response = connection.get('0')
      JSON.parse(response.body)
    end
  end
end
