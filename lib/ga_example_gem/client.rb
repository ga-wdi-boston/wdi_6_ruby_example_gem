require 'json'
require 'httparty'
require 'ga_example_gem/configuration'
require 'addressable/uri'

module GaExampleGem
	
	# This is our client that we can initialize with
	# GaExampleGem.new
	class Client
		include GaExampleGem::Configuration
		include HTTParty

  # @client = GaExampleGem::Client.new
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

    def get_xkcds_from_year(year)
      if !self.api_key.empty?
        JSON.parse HTTParty.get("http://xkcd-unofficial-api.herokuapp.com/xkcd?year=#{year}&api_key=#{self.api_key}")
      else
        JSON.parse HTTParty.get("http://xkcd-unofficial-api.herokuapp.com/xkcd?year=#{year}")
      end
    end

    # 
    # get_comics(year: '2007', month: '2')
    def get_comics(params={})
      unless api_key.empty?
        params[:api_key] = api_key
      end

      uri = Addressable::URI.new
      uri.query_values = params
      uri_suffix = uri.query

      JSON.parse HTTParty.get("http://xkcd-unofficial-api.herokuapp.com/xkcd?#{uri_suffix}")
    end

	end
end












