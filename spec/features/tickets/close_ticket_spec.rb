require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do

	let(:admin) { create(:user, :admin) }
	let(:organization) { create(:organization, :approved)}
	let(:ticket) { create(:ticket) }

	context 'as an admin' do
		it 'closes a ticket' do
			log_in_as(admin)
			visit ticket_path(ticket)
			click_on 'Close'
			expect(page).to have_content('Closed')
		end
	end

end
