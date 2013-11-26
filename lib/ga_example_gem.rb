require 'pry'
require 'ga_example_gem/client'

module GaExampleGem
	class << self
		# Alias for GaExampleGem::Client.new
		def new
      @client ||= GaExampleGem::Client.new
    end

    # Delegate to GaExampleGem::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end