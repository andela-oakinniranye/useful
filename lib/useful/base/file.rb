module Useful
  class UsefulFile
    cattr_reader :files
    attr_reader :id, :name, :size, :parent, :owner, :type, :location
    @parent = '0'
    @@files = []

    def initialize(file_s = {})
      set_attr Hashie::Mash.new(file_s) if file_s.is_a? Hash
      # file_s.each{ |file| } if file_s.is_a? Array
      @@files << self
    end

    def set_attr file
      @id = file.id
      @name = file.name
      @size = file.size
      @parent = file.parent
      @owner = file.owner
      @type = file.type
      @location = file.location
    end

  end
end
