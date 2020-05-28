require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
	let(:admin) { create(:user, :admin) }
	let(:organization) { create(:organization) }

	context 'As an admin user do' 
		it 'updates an organization' do
			log_in_as(admin)
			visit edit_organization_path(organization)
			#byebug
			#click_on('Edit Organization')
			#expect(current_path).to eq edit_organization_path(organization)
			#fill_in 'Name', with: 'Default fake name'
			#click_on 'Save'
 			#expect(page).to have_content('Default fake name')
		end
	end

	context 'As an organization user' do
		let(:organization) { create(:organization, :approved) }
		let(:user) { create(:user, organization: organization) }

		before do
			user.organization = organization
			user.save
		end

		it 'updates an organization successfully' do
			log_in_as(user)
			visit edit_organization_path(organization)
			#byebug
			#click_on('Edit Organization')
			#fill_in 'Name'.with('Default fake name')
			#click_on 'Save'
			#expect(page).to have_content('Default fake name')
		end

	end
