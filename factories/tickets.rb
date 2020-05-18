FactoryBot.define do

  factory :ticket do
    sequence :id do |n|
      "#{n}"
    end

    sequence :name do |n|
      "Ticket #{n}"
    end
    phone { '+19 62 123 00 00' }
    description { 'Fake' }
    resource_category_id { create(:resource_category).id }
    region_id { create(:region).id }

    trait :open do
    	closed { false }
  	end

    trait :closed do
      closed { true }
    end

    trait :with_organization do
      organization_id { true }
    end

    trait :without_organization do
      organization_id { nil }
    end

  end

end