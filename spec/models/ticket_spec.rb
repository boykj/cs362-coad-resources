require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it {should belong_to(:organization)}
  it {should belong_to(:region)}
	it {should belong_to(:resource_category)}
	
	it "has a phone" do
		ticket = Ticket.new
		expect(ticket).to respond_to(:phone)
	end

	it "has a name" do
		ticket = Ticket.new
		expect(ticket).to respond_to(:name)
	end
end
