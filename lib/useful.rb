require 'useful/version'
require 'active_support/all'
require 'pathname'

module Useful
  # Your code goes here...
  # attr_reader :event, :built_event
  extend ActiveSupport::Concern

end

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
Dir[APP_ROOT.join('lib', 'useful', '*', '*.rb')].each { |f| require f }
