require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do


	it "returns admin dashboard" do
		user = double()
		user.stub(:admin?).and_return(true)
		expect(dashboard_for(user)).to eq('admin_dashboard')
	end

	it "returns organization submission dashboard" do
		User.any_instance.stub(:admin?).and_return(false)
		user = User.new
		user.stub_chain(:organization, :submitted?).and_return(true)
		#byebug
		expect(dashboard_for(user)).to eq('organization_submitted_dashboard')
	end

	# it "returns organization approved dashboard" do
	# 	User.any_instance.stub(:admin?).and_return(false)
	# 	user = User.new
	# 	#byebug
	# 	user.stub_chain(:organization, :approved?).and_return(true)
	# 	expect(dashboard_for(user)).to eq('organization_approved_dashboard')
	# end

	it "example_method invokes objects side_effect" do
		obj = double(:side_effect)
		expect(obj).to receive(:side_effect)
		example_method(obj)
	end	




end
