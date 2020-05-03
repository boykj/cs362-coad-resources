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
	
end
