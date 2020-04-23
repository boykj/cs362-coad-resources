require 'rails_helper'

RSpec.describe Organization, type: :model do
	let (:org) { Organization.new(name: 'FAKE', email: 'dataCollection@gmail.com') }

	describe "relationships" do
		it "has many users" do
			expect(org).to have_many(:users)
		end
		it "has many tickets" do
			expect(org).to have_many(:tickets)
		end
		it "has and belongs to many resource categories" do
			expect(org).to have_and_belong_to_many(:resource_categories)
		end
	end
	
	describe "properties" do
		it "has an email" do
			expect(org).to respond_to(:email)
		end
		it "has a name" do
			expect(org).to respond_to(:name)
		end
		it "has a phone" do
			expect(org).to respond_to(:phone)
		end
		it "has a status" do
			expect(org).to respond_to(:status)
		end
		it "has a primary name" do
			expect(org).to respond_to(:primary_name)
		end
		it "has a secondary name" do
			expect(org).to respond_to(:secondary_name)
		end
		it "has a secondary phone" do
			expect(org).to respond_to(:secondary_phone)
		end
	end

	describe "#to_s" do
		it "has a string representation that is a name" do
			expected_name = 'FAKE'
			expect(org.to_s).to eq(expected_name)
		end
	end

	describe "validations" do
		it "validates name" do
			expect(org).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end

		it "validates email" do 
			expect(org).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
		end

		it "validates description" do
			expect(org).to validate_length_of(:description).is_at_most(1020).on(:create)
		end


	end
		
end
