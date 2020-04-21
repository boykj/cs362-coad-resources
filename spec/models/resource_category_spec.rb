require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	it {should have_many(:tickets)}
	it {should have_and_belong_to_many(:organizations)}

	it "has a name" do
		resource = ResourceCategory.new()
		expect(resource).to respond_to(:name)
	end	

end
