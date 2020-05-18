FactoryBot.define do
  factory :resource_category do
    sequence :name do |n|
      "Default #{n}"
    end
  end
end