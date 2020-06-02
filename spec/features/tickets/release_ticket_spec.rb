require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do

	let(:user) { create(:user, :organization_member) }
	let(:organization) { create(:organization, :approved)}
	let(:ticket) { create(:ticket) }

	before do
		user.organization = organization
		ticket.name = 'default'
		user.save 
		ticket.save
	end

	context 'organization user' do
		it 'it captures a ticket' do
			log_in_as(user)
			visit dashboard_path()
			click_link 'Tickets'
			click_on 'default'
			click_on 'Capture'
			visit ticket_path(ticket)
			click_on 'Release'
			expect(page).to have_content('Capture')
		end
	end
	
end
