require 'rails_helper'

RSpec.describe User, type: :model do
	
	it {should belong_to(:organization)}

	it "has an email" do
		user = User.new
		expect(user).to respond_to(:email)
	end
	it "has a password" do
		user = User.new
		expect(user).to respond_to(:password)
	end
end
