# Require files in your internal folder
require 'ga_example_gem/client'

# This is our GaExampleGem namespace
# for our gem
module GaExampleGem
	class << self
		# Alias for GaExampleGem::Client.new
		def new
      @client ||= GaExampleGem::Client.new
    end

    # Delegate to GaExampleGem::Client
    # This is a weird trick that allows for calling 
    # on methods without calling .new first
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end


    # This is used for the method_missing to see
    # if a new client would respond to a method
    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end