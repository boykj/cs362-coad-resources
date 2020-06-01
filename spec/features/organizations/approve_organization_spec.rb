require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  let(:admin) { create(:user, :admin) }
  let(:organization) { create(:organization) }

  context 'As an admin user' do
		it 'approved an organization' do
			log_in_as(admin)
			visit organizations_path(organization)
			click_on 'Pending'
			click_on 'Review'
			click_on 'Approve'
			expect(page).to have_content(organization)
		end
	end
end
