require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
	let(:user) { create(:user, :organization_member) }

	context 'As an organization user' do
		it 'logs in' do
			log_in_as(user)
		 	expect(page).to have_content('Dashboard')
		end
	end

end
