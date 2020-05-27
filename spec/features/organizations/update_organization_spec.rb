require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
	let(:organization) { create(:organization) }

	context 'As an admin user do' 
		it 'updates an organization' do
			visit edit_organization_path(organization)
			organization.stub(:name).and_return('Default fake name')
			#click_on 'Save Changes'
			#expect(page).to have_content('Default fake name')
		end
	end

	context 'As an organization user' do
		let(:user) { create(:user) }
		let(:organization) { create(:organization, :approved) }

		before do
			user.organization = organization
			user.save
		end

		it 'updates an organization successfully' do
			visit edit_organization_path(organization)
			#byebug
			#fill_in(organization.name).with('Default fake name')
			#click_on 'Save Organization'
			#expect(page).to have_content('Default fake name')
		end

	end
