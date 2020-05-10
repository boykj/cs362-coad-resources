require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

	context 'As a non logged-in' do

		describe 'GET #index' do
			specify { expect(get(:index)).to redirect_to(new_user_session_path) }
		end

	end

	context 'Public user' do
		
		let(:user) { FactoryBot.create(:user) }
		before(:each) { sign_in(user) }

		describe 'GET #index' do
			#specify { expect(get(:index)).to redirect_to(dashboard_path) }
		end

	end
	
	context 'Organization user' do
		# Redirect to dashboard
	end

	context 'Admin user' do
		let(:admin_user) { FactoryBot.create(:user, :admin) }
		before(:each) { sign_in(admin_user) }

		describe 'GET #index' do
			#specify { expect(get(:index)).to be_successful }
		end
	end
	
end
