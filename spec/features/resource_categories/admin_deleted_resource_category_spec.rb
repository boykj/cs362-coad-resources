require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  let(:admin) { create(:user, :admin) }
	let(:resource_category) { create(:resource_category) }
	
	context 'As an admin' do
		it 'deletes a resource category' do
			log_in_as(admin)
			visit resource_category_url(resource_category)
			click_on 'Delete'
			expect {
				accept_alert "Are you sure? This cannot be undone. Any tickets will have an Unspecified resource category." do
					click_link 'OK'
				end
				sleep 1.second
			}
			visit resource_categories_path
			expect(page).to_not have_content(resource_category)
		end
	end
	
end
