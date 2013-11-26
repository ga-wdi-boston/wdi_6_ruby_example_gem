module GaExampleGem

  # This is the configuration module that 
  # allows us to setup an api_key
  # using a pattern close to the Twitter or MtGox gem
	module Configuration

    # This is our API key. We aren't really using it
    # anywhere, but you could imagine using it
    # with HTTP requests
    # This is tricky, this adds these attr_accessors to the CLASS
		attr_accessor :api_key, :oauth_key

    # This yields a block that can be iterated on
    # Its useful for being able to set values to the
    # attr_accessor
    def configure
      yield self
    end

    # This reset our API key and is called when the 
    # client is initialized
    def reset
      self.api_key = nil
      self
    end
	end
end