require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do

	let(:admin) { create(:user, :admin) }
	let(:user) { create(:user, :organization_member) }
	let(:organization) { create(:organization, :approved)}
	let(:ticket) { create(:ticket) }
	let(:org_ticket) { create(:ticket) }

	before do
		user.organization = organization
		user.save
	end

	context 'as an admin' do
		it 'closes a ticket' do
			log_in_as(admin)
			visit ticket_path(ticket)
			click_on 'Close'
			expect(page).to have_content('Closed')
		end
	end

	context 'as an organization member' do
		it 'closes a ticket' do
			log_in_as(user)
			visit ticket_path(org_ticket)
			click_on 'Capture'
			visit ticket_path(org_ticket)
			click_on 'Close'
			expect(page).to have_content('Closed')
		end
	end

end
