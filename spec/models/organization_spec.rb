require 'rails_helper'

RSpec.describe Organization, type: :model do
	let (:org) {Organization.new}

	describe "relationships" do
		it "has many users" do
			expect(org).to have_many(:users)
		end
		it "has many tickets" do
			expect(org).to have_many(:tickets)
		end
	end
	
	describe "properties" do
		it "has a name" do
			expect(org).to respond_to(:name)
		end
		it "has an email" do
			expect(org).to respond_to(:email)
		end
		it "has a name" do
			expect(org).to respond_to(:status)
		end
		it "has a name" do
			expect(org).to respond_to(:primary_name)
		end
		it "has a name" do
			expect(org).to respond_to(:secondary_name)
		end
		it "has a name" do
			expect(org).to respond_to(:secondary_phone)
		end
	end
		
end
