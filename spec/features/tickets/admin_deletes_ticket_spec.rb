require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do

	let(:admin) { create(:user, :admin) }
	let(:ticket) { create(:ticket) }

context 'as an admin' do 
	it 'it deletes a ticket' do
		log_in_as(admin)
		visit ticket_path(ticket)
		click_on 'Delete'
			expect {
				accept_alert "Are you sure? This cannot be undone." do
					click_link 'OK'
				end
				sleep 1.second
			}
			visit dashboard_path()
			expect(page).to_not have_content(ticket)
		end
	end
end
