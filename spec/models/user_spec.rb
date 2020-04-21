require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) {User.new}
	let(:user1) {User.new}

	#it {should belong_to(:organization)

	it "has an email" do
		expect(user).to respond_to(:email)
	end
	it "has a password" do
		expect(user).to respond_to(:password)
	end

end
