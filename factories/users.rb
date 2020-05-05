FactoryBot.define do
	factory :user do
		email { 'fake@google.com' }

		trait :admin do
			role { :admin }
		end

		trait :organization_account do
			role { :organization }
		end
  end
end