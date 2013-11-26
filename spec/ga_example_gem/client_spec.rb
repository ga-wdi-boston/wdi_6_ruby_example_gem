require 'spec_helper'

describe GaExampleGem::Client do
	before do
    @client = GaExampleGem::Client.new
    @client.configure do |config|
      config.api_key = "its a secret to everybody"
    end
  end

  describe '#get_xkcd' do
  	before do
      stub_request(:get, 'http://xkcd-unofficial-api.herokuapp.com/xkcd?num=1').
        to_return(body: fixture('single_xkcd.json'))
    end

    it "fetchs a single xkcd webcomic" do
      comic = @client.get_xkcd(1)
      expect(a_request(:get, 'http://xkcd-unofficial-api.herokuapp.com/xkcd?num=1')).to have_been_made
      expect(comic.first["title"]).to eq "Barrel - Part 1"
    end
  end
end