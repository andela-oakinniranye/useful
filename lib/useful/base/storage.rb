module Useful
  module Base
    class Storage
      attr_reader :uploads, :downloads
      @@files = []

      def save
        @@files.each{|file|
          # upload
        }
      end

      def add_file(file)
        @@files << file if file.is_a? UsefulFile
        self
      end

      def download_file(file_id)

      end

      def add_file_to_folder(file, folder_id)

      end

      def fetch_data

      end

      def delete(id)

      end

      def self.fetch_all

      end
    end
  end
end
