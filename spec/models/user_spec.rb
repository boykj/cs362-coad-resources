require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) {User.new(email: 'fakeyboi@googledatacollection.com')}
	let(:user1) {User.new}

	#it {should belong_to(:organization)

	describe "properties" do
		it "has an email" do
			expect(user).to respond_to(:email)
		end
		it "has a password" do
			expect(user).to respond_to(:password)
		end
	end

	describe "#to_s" do
		it "has a string that is the email" do
			expected_email = 'fakeyboi@googledatacollection.com'
			expect(user.to_s).to eq(expected_email)
		end
	end

end
