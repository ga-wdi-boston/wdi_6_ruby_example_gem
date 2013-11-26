require 'spec_helper'

describe GaExampleGem do
	describe '.new' do
		it "returns a GaExampleGem::Client" do
			expect(GaExampleGem.new).to be_a GaExampleGem::Client
		end
	end

end