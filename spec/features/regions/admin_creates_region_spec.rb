require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
	let(:admin) { create(:user, :admin) }
	let(:region) { create(:region) }

	context 'As an admin user' do
		it 'creates a region' do
			log_in_as(admin)
			visit new_region_path(region)
			fill_in 'Name', with: 'Default region name'
			click_on 'Add Region'
			expect(page).to have_content('Default region name')
		end
	end

end
