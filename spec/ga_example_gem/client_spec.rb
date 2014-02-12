require 'spec_helper'

describe GaExampleGem::Client do
	before do
    @client = GaExampleGem::Client.new
    @client.configure do |config|
      config.api_key = ""
    end
    @authenticated_client = GaExampleGem::Client.new
    @authenticated_client.configure do |config|
      config.api_key = "foobar"
    end
  end

  describe '#get_xkcd' do
  	before do
      stub_request(:get, 'http://xkcd-unofficial-api.herokuapp.com/xkcd?num=1').
      to_return(body: fixture('single_xkcd.json'))
    end

    it "fetchs a single xkcd webcomic" do
      # Make the request
      comic = @client.get_xkcd(1)

      # Expect that you made a request
      expect(a_request(:get, 'http://xkcd-unofficial-api.herokuapp.com/xkcd?num=1')).to have_been_made
      
      # Check the results of the JSON file/body of HTTP request that we intercepted
      expect(comic.first["title"]).to eq "Barrel - Part 1"
    end
  end

  describe '#get_xkcds_from_year' do
    before do
      stub_request(:get, 'http://xkcd-unofficial-api.herokuapp.com/xkcd?year=2006').
      to_return(body: fixture('unauthenticated_2006_results_xkcd.json'))
    end

    it "returns a max of 3 comics for unauthenticated client" do
      comics = @client.get_xkcds_from_year(2006)
      expect(a_request(:get, 'http://xkcd-unofficial-api.herokuapp.com/xkcd?year=2006')).to have_been_made
      expect(comics).to be_an Array
      expect(comics.first["title"]).to eq "Barrel - Part 1"
      expect(comics.count).to eq 3
    end
  end
end