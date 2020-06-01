require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do
  let(:admin) { create(:user, :admin) }
  let(:organization) { create(:organization) }

  context 'As an admin user' do
    it 'approved an organization' do
        log_in_as(admin)
        visit organizations_path(organization)
        click_on 'Pending'
				click_on 'Review'
				fill_in 'Rejection Reason', with: 'This organization is hot garbage'
        click_on 'Reject'
        expect(page).to have_content('This organization is hot garbage')
    end
  end
end
