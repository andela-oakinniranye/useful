module Useful
  class UsefulFile
    cattr_reader :files
    attr_reader :id, :name, :size, :parent, :owner, :type, :location
    @parent = '0'
    @@files = []

    def initialize(file = {})
      set_attr OpenStruct.new(file) if file.is_a? Hash
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
