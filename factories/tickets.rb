FactoryBot.define do

  factory :ticket do

    sequence :name do |n|
      "Ticket #{n}"
    end
    phone { '+19 62 123 00 00' }
    description { 'Fake' }
    resource_category { create(:resource_category) }
    region { create(:region) }

    trait :open do
    	closed { false }
  	end

    trait :closed do
      closed { true }
    end

    trait :with_organization do
      organization { create(:organization) }
    end

    trait :without_organization do
      organization { nil }
    end

  end

end