require 'rails_helper'

RSpec.describe Region, type: :model do
	#let(:region) {Region.new(name: 'FAKE')}
	let(:region) { FactoryBot.build(:region) }

	#properties
	it "region has name" do
		expect(region).to validate_presence_of(:name)
	end

	#relationships
	describe "relationships" do 
		it "has many tickets" do
			expect(region).to have_many(:tickets)
		end
	end

	#validations
	describe "validations" do
		it "validates length of name on create" do
			expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end

		it "validates uniqueness of name, not case sensitive" do
			expect(region).to validate_uniqueness_of(:name).case_insensitive
		end
	end

	#methods
	describe "#to_s" do
		it "has a string that is the name" do
			region.name = 'Default'
			expected_name = 'Default'
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
