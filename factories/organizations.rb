FactoryBot.define do
  factory :organization do
		name { 'Default' }
		status { :submitted }
		email { 'fake@google.com' }
		primary_name { 'Default primary' }
		secondary_name { 'Default secondary' }
		phone { '+19 62 123 00 01' }
		secondary_phone { '+19 62 123 00 00' }
	end
	
	factory :fake_organization do
		name { 'Fake' }
		email { 'Fake' }
	end
end