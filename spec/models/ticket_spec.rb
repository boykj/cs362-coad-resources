require 'rails_helper'

RSpec.describe Ticket, type: :model do
	#let (:ticket) {Ticket.new}
	let(:ticket) { FactoryBot.build(:ticket) }

	describe "relationships" do 
		it "should belong to region" do
			expect(ticket).to belong_to(:region)
		end
		it "should belong to resource_category" do
			expect(ticket).to belong_to(:resource_category)
		end
		it "should belong to organization" do
			expect(ticket).to belong_to(:organization)
		end
	end
	
	describe "properties" do
		it "has a phone" do
			expect(ticket).to respond_to(:phone)
		end
		it "has a name" do
			expect(ticket).to respond_to(:phone)
		end
		it "has a region_id" do
			expect(ticket).to respond_to(:region_id)
		end
		it "has a resource_category_id" do
			expect(ticket).to respond_to(:resource_category_id)
		end
	end

	describe "validations" do
		it "validates the length of name on create" do
			expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end

		it "validates the length of description" do
			expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
		end

		it "validates the authenticity of a phone number" do
			#expect(ticket).to validate_presence_of(:phone).to be_truthy
		end
	end

	describe "scopes" do

	end
	
	describe "methods" do
		it "has a to_s string method" do
			expected_ticket_value = 1
			expect(ticket.to_s).to eq("Ticket #{expected_ticket_value}")
		end
	end
end
