FactoryBot.define do
	factory :user do
		email { 'fake@google.com' }
		password { 'FAKE_password' }
		role {}

		trait :admin do 
			role { :admin }
		end

		trait :organization_account do
			role { :organization }
		end
  end
end