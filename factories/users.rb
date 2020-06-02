FactoryBot.define do
	factory :user do

    sequence :email do |n|
      "user_email#{n}@google.com"
    end		
		password { 'FAKE_password' }

		trait :admin do 
			role { :admin }
		end

		trait :organization_member do
			role { :organization }
		end

		after :create do |user|
			user.confirm
		end

	end
	
end