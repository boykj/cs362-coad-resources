require 'rails_helper'

RSpec.describe Region, type: :model do
	let(:region) {Region.new(name: 'FAKE')}

	#properties
	it "region has name" do
		expect(region).to respond_to(:name)
	end

	#relationships
	describe "relationships" do 
		it "has many tickets" do
			expect(region).to have_many(:tickets)
		end
	end

	#validations

	#methods
	describe "#to_s" do
		it "has a string that is the name" do
			expected_name = 'FAKE'
			expect(region.to_s).to eq(expected_name)
		end
	end

	describe "::unspecified" do
		it "creates a new unspecified resource category" do
			expect(Region.where(name: 'Unspecified')).to be_empty
			expect{Region.unspecified}.to change{Region.count}.by(1)
		end
	end
	
end
