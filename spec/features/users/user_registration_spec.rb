require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
	let (:user) { create(:user) }
	
	context 'As a new user' do
		it 'registers an account' do
			visit new_user_registration_path()
			fill_in 'Email', with: 'testemail@google.com'
			fill_in 'Password', with: 'password'
			fill_in 'Password confirmation', with: 'password'
			click_button('Sign up')
			expect(page).to have_content('Disaster Resource Network')
		end
	end
	
end
