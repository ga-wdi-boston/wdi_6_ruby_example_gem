require 'json'
require 'httparty'
require 'ga_example_gem/configuration'

module GaExampleGem
	
	# This is our client that we can initialize with
	# GaExampleGem.new
	class Client
		include GaExampleGem::Configuration
		include HTTParty

		# This resets our API keys when it is initialized
		def initialize
      reset
  	end

  	# This method gets the JSON for a single XKCD comic
  	# by number
  	def get_xkcd(number)
  		# This works too
  		# JSON.parse self.class.get("http://xkcd-unofficial-api.herokuapp.com/xkcd?num=#{number}")
  		JSON.parse HTTParty.get("http://xkcd-unofficial-api.herokuapp.com/xkcd?num=#{number}")
  	end
	end
end