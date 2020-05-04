FactoryBot.define do
  factory :organization do
		name { 'Default' }
		status { :submitted }
		email { 'fake@google.com' }
	end
	
	factory :fake_organization do
		name { 'Fake' }
		email { 'Fake' }
	end
end