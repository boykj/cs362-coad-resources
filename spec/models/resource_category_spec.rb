require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
	let(:resource_category) {ResourceCategory.new}

	describe "relationships" do
		it "has many tickets" do
			expect(resource_category).to have_many(:tickets)
		end
		it "has many and belongs to many organization" do
			expect(resource_category).to have_and_belong_to_many(:organizations)
		end
	end

	it "has a name" do
		expect(resource_category).to respond_to(:name)
	end	

end
