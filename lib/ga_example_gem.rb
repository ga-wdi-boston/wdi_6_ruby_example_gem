# Require files in your internal folder
require 'ga_example_gem/client'

# This is our GaExampleGem namespace
# for our gem

module GaExampleGem
  # This is weird. 
  # These are now class methods.
  # So you no longer have to call def self.method_missing
	class << self  
		# Alias for GaExampleGem::Client.new
		def new
      @client ||= GaExampleGem::Client.new
    end

    # Delegate to GaExampleGem::Client
    # This is a weird trick that allows for calling 
    # on methods without calling .new first
    def method_missing(method, *args, &block)
      # Normally this raises an error
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end


    # This is used for the method_missing to see
    # if a new client would respond to a method
    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end

    # The logic for above
    # 1) Call a method, GaExampleGem.configure
    # 2) Run .method_missing, because we don't have that method
    # 3) Name of method is 'configure'
    # 4) Does a new instance of the client respond to configure?
    # 5) If yes, create a new client and run the method 'configure'
  end
end