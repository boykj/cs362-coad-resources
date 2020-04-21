require 'rails_helper'

RSpec.describe Region, type: :model do
	it "region has name" do
		region = Region.new
		expect(region).to respond_to(:name)
  end
end
