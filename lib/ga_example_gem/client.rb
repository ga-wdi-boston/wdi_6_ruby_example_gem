require 'ga_example_gem/configuration'

module GaExampleGem
	class Client
		include GaExampleGem::Configuration
		include HTTParty
			
		def initialize
      reset
  	end

  	def get_xkcd(number)

  	end
	end
end