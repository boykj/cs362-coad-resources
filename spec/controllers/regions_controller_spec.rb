require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

	context 'Public user' do
		describe 'regions' do
		#Verify they can't do anything
		# redirect to sign in page
		end
	end
	
	context 'Organization user' do
		# Redirect to dashboard
	end

	context 'Admin user' do
		#Redirect accordingly
	end
	
end
