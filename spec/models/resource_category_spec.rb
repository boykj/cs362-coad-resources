require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
	let(:resource_category) {ResourceCategory.new(name: 'FAKE')}

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

	describe "methods" do
		it "has a string that is the name" do
			expected_name = 'FAKE'
			expect(resource_category.to_s).to eq(expected_name)
		end

		it "has an activate method" do
			expect(resource_category.activate).to be_truthy
		end

		it "has a deactivate method" do
			expect(resource_category.deactivate).to be_truthy
		end

		it "has an inactive method" do
			#active_resource_category = ResourceCategory.new(active:true)
			expect(resource_category.inactive?).to be_falsey
		end
	end

	describe "::unspecified" do
		it "creates a new unspecified resource category" do
			expect(ResourceCategory.where(name: 'Unspecified')).to be_empty
			expect{ResourceCategory.unspecified}.to change{ResourceCategory.count}.by(1)
		end
	end


end
