require 'rails_helper'

RSpec.describe Ticket, type: :model do
	let(:ticket) { FactoryBot.build(:ticket) }
	let(:region) { FactoryBot.create(:region) } 
	let(:resource_category) { FactoryBot.create(:resource_category) }
	let(:organization) { FactoryBot.create(:organization) }

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
			expect(ticket).to validate_presence_of(:phone)
		end
		it "has a name" do
			expect(ticket).to validate_presence_of(:phone)
		end
		it "has a region_id" do
			expect(ticket).to validate_presence_of(:region_id)
		end
		it "has a resource_category_id" do
			expect(ticket).to validate_presence_of(:resource_category_id)
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
			ticket.region = region
			ticket.resource_category = resource_category
			expect(ticket).to be_valid
			ticket.phone = 'INVALID'
			expect(ticket).to_not be_valid
		end

	end

open_tickets = Ticket.where(closed: false)

	describe "scopes" do

		describe "open" do

			let(:open_ticket) { create(:ticket, :open) }
			let(:closed_ticket) { create(:ticket, :closed) }
			let(:open_with_org) { create(:ticket, :open, :with_organization) }
			let(:closed_with_org) { create(:ticket, :closed, :with_organization) }
			open_tickets = Ticket.where(closed: false)
			
			it "retrieves and open scope with with a nil organization id" do			
				expect(open_tickets).to include(open_ticket)
			end

			it "retrieves a ticket with a closed scope" do
				expect(open_tickets).not_to include(:closed_ticket)
			end

			it "retrieves an open ticket with all organizations" do
				skip
			end

			it "retrieves an open ticket with an organization" do
				open_tickets_with_organization = Ticket.where(closed: false, organization_id: true)
				expect(open_tickets_with_organization).to include(open_with_org)
				expect(open_tickets_with_organization).to_not include(closed_with_org)
			end

			it "retrieves a closed ticket without an organization" do
				closed_tickets_without_organization = Ticket.where(closed: true, organization_id: true)
				expect(closed_tickets_without_organization).to include(closed_with_org)
				expect(closed_tickets_without_organization).to_not include(open_ticket)
			end

			it "retrieves a ticket with a region id scope" do
				region_tickets = Ticket.where(region_id: true)
				expect(region_tickets).to include(open_ticket)
			end

			it "retrieves a ticket with a resource_category_id" do
				resource_category_tickets = Ticket.where(resource_category: true)
				expect(resource_category_tickets).to include(open_ticket)
			end

		end

	end
	
	describe "methods" do
		it "has a to_s string method for ticket ID" do
			ticket.id = 1
			expected_ticket_value = 1
			expect(ticket.to_s).to eq("Ticket #{expected_ticket_value}")
		end

		it "has a captured? method" do
			expect(ticket.captured?).to be_falsey
		end

		it "has an opposite captured? method" do
			ticket.organization = organization
			expect(ticket.captured?).to be_truthy
		end

		it "has an open? method" do
			expect(ticket.open?).to be_truthy
		end

	end

end
