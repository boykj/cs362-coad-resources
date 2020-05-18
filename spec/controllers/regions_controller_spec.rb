require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
#let(:admin_user) { FactoryBot.create(:user, :admin) }


	context 'As a non logged-in' do

		describe 'GET #index' do
			specify { expect(get(:index)).to redirect_to(new_user_session_path) }
		end

	end

	context 'As an organization user' do
		
		let(:user) { FactoryBot.create(:user, :organization_member) }
		before(:each) { sign_in(user) }

		describe 'GET #index' do
			specify { expect(get(:index)).to redirect_to(dashboard_path) }
		end

	end

	context 'Admin user' do

		let(:admin_user) { FactoryBot.create(:user, :admin) }
		before(:each) { sign_in(:admin_user) }

		describe 'GET #index' do
			#specify { expect(get(:index)).to be_successful }
			#byebug
			#specify { expect(get(:index)).to redirect_to(dashboard_path) }
		end

	end

	
	
	# describe 'methods' do

	# 	let(:admin) { FactoryBot.create(:user, :admin) }
	# 	let(:region) { FactoryBot.create(:region) } 


	# 	it "has an index funtion"
	# 		specify{ expect(region.index).to be_successful }


	# end

end
