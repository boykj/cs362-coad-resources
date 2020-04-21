require 'rails_helper'

RSpec.describe Organization, type: :model do

  it {should have_many(:users)}
  it {should have_many(:tickets)}
	it {should have_and_belong_to_many(:resource_categories)}
	
	it "has a name, email, phone, status, primary_name, secondary_name, secondary_phone" do
		org = Organization.new()
		expect(org).to respond_to(:email)
		expect(org).to respond_to(:name)
		expect(org).to respond_to(:phone)
		expect(org).to respond_to(:status)
		expect(org).to respond_to(:primary_name)
		expect(org).to respond_to(:secondary_name)
		expect(org).to respond_to(:secondary_phone)
	end
	
end
