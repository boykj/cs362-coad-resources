require 'rails_helper'

RSpec.describe Ticket, type: :model do
	let (:ticket) {Ticket.new}

	describe "relationships" do 
		it "should belong to region" do
			expect(ticket).to belong_to(:region)
		end
		it "should belong to resource_category" do
			expect(ticket).to belong_to(:resource_category)
		end
	end
  it {should belong_to(:organization)}
	
	it "has a phone, name, region_Id, resource_category_id" do
		ticket = Ticket.new
		expect(ticket).to respond_to(:phone)
		expect(ticket.phone_was) == true
		expect(ticket).to respond_to(:name)
		expect(ticket).to respond_to(:region_id)
		expect(ticket).to respond_to(:resource_category_id)
	end
end
