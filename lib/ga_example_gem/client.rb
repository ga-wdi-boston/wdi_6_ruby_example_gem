require 'json'
require 'httparty'
require 'ga_example_gem/configuration'

module GaExampleGem
	class Client
		include GaExampleGem::Configuration
		include HTTParty

		def initialize
      reset
  	end

  	def get_xkcd(number)
  		JSON.parse self.class.get("http://xkcd-unofficial-api.herokuapp.com/xkcd?num=#{number}")
  	end
	end
end