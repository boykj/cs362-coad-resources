require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	it "has a name" do
		resource = ResourceCategory.new()
		expect(resource).to respond_to(:name)
	end	

end
