require 'spec_helper'

describe GaExampleGem do
	describe '.new' do
		it "returns a GaExampleGem::Client" do
			expect(GaExampleGem.new).to be_a GaExampleGem::Client
		end
	end

	describe ".configure" do
    it "sets api_key" do
      GaExampleGem.configure do |config|
        config.api_key = "its a secret to everybody"
      end

      expect(GaExampleGem.api_key).to eq "its a secret to everybody"
    end
  end
end