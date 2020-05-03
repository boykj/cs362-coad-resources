require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) { FactoryBot.build(:user) }

	it {should belong_to(:organization) }

	describe "relationships" do
		it "has an email" do
			expect(user).to respond_to(:email)
		end
		it "has a password" do
			expect(user).to respond_to(:password)
		end
	end

end
