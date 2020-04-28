require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
	let(:resource_category) {ResourceCategory.new}

	it "has a name" do
		expect(resource_category).to respond_to(:name)
	end	

	describe "relationships" do
		it "has many tickets" do
			expect(resource_category).to have_many(:tickets)
		end
		it "has many and belongs to many organization" do
			expect(resource_category).to have_and_belong_to_many(:organizations)
		end
	end

	describe "validations" do
		it "validates length of name on create" do
			expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end

		it "validates uniqueness of name, not case sensitive" do
			expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
		end
	end

end
