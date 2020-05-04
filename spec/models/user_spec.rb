require 'rails_helper'

RSpec.describe User, type: :model do
	let(:user) { FactoryBot.build(:user) }

	describe "relationships" do
		specify {expect(user).to belong_to(:organization)}
	end

	describe "vaidations" do
		it "has an email" do
			expect(user).to validate_presence_of(:email)
		end

		it "has a password" do
			expect(user).to validate_presence_of(:password)
		end

		it "validates length of email" do
			expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
		end

		it "validates uniqueness of email" do
			expect(user).to validate_uniqueness_of(:email).case_insensitive 
		end

		it "validates presence of password" do
			expect(user).to validate_presence_of(:password).on(:create)
		end

		it "validates length of password" do
			expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255)
		end
	end

	describe "validates the email format" do
		it { should allow_value('fake@google.com').for(:email) }
	end

	describe "identifies incorrect email" do
		it {should_not allow_value('123432randomstring').for(:email) }
	end

	describe "methods" do
		it "sets default role" do
			# TODO
		end

		it "has a string that is the email" do
			expected_email = 'fake@google.com'
			expect(user.to_s).to eq(expected_email)
		end
	end
	
end
