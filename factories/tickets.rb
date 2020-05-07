FactoryBot.define do

  factory :ticket do
    name { 'Default' }
    id { '1' }
    phone { '123-1234' }
    #description { 'Default Description' }
    resource_category_id { 'Resource_1' }
    region_id { 'Region_1' }

    trait :open do
    	closed { false }
  	end

    trait :closed do
      closed { true }
    end

    trait :open_with_organization do
      closed { false }
      organization { Organization.new }
    end

    trait :closed_with_organization do
      closed { true }
      organization { Organization.new }
    end

  end

end