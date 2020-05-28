FactoryBot.define do
	factory :organization do
		
    sequence :name do |n|
      "Organization #{n}"
		end
		
    sequence :email do |n|
      "organization_email#{n}@google.com"
    end				

		status { :submitted }
		primary_name { 'Default primary' }
		secondary_name { 'Default secondary' }
		phone { '+19 62 123 00 01' }
		secondary_phone { '+19 62 123 00 00' }

    trait :approved do
    	status { :approved }
		end
		
	end
end