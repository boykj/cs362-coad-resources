require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do

	before :each do
		@region = Region.create(name: 'Fake Region')
		@resource_category = Resource_category.create(name: 'Fake Category')
		@user = User.create(name: 'Fake name')
	end

end
