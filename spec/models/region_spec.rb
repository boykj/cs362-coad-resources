require 'rails_helper'

RSpec.describe Region, type: :model do
	let(:region) {Region.new}
	
	it {should have_many(:tickets)}

	it "region has name" do
		expect(region).to respond_to(:name)
	end
	
end
