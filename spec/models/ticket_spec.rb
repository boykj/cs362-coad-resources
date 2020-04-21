require 'rails_helper'

RSpec.describe Ticket, type: :model do
	let (:ticket) {Ticket.new}

  it {should belong_to(:organization)}
  it {should belong_to(:region)}
	it {should belong_to(:resource_category)}
	
	it "has a phone, name, region_Id, resource_category_id" do
		ticket = Ticket.new
		expect(ticket).to respond_to(:phone)
		expect(ticket.phone_was) == true
		expect(ticket).to respond_to(:name)
		expect(ticket).to respond_to(:region_id)
		expect(ticket).to respond_to(:resource_category_id)
	end
end
