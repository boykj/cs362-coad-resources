require 'rails_helper'

RSpec.describe Organization, type: :model do
	let(:org) { FactoryBot.build(:organization) }
	let(:fake_org) {FactoryBot.create(organization) }

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

	describe "validations" do
		it "validates length of name" do
			expect(org).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end

		it "validates uniquness of name" do
			expect(org).to validate_uniqueness_of(:name).case_insensitive
		end

		it "validates length of email" do 
			expect(org).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
		end

		it "validates uniqueness of email" do
			expect(org).to validate_uniqueness_of(:email).case_insensitive
		end

		it "validates length of description" do
			expect(org).to validate_length_of(:description).is_at_most(1020).on(:create)
		end

		it "validates authenticity" do
			expect(org).to be_valid
		end

		describe "validates the email format" do
			it { should allow_value('email@address.com').for(:email) }
		end

		describe "identifies an incorrect email" do
			it { should_not allow_value('Fake').for(:email) }
		end

	end

	describe "methods" do
		it "has an approve method" do
			expect(org.approve).to eq(:approved)
		end

		it "has a reject method" do
			expect(org.reject).to eq(:rejected)
		end

		it "has a string representation that is a name" do
			expected_name = org.name
			expect(org.to_s).to eq(expected_name)
		end

		it "should not override default status" do
			#expect(org.set_default_status).to eq(:submitted)
		end
	end
		
end
