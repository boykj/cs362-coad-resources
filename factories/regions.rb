FactoryBot.define do

  factory :region do
    sequence :name do |n|
      "Default #{n}"
    end
  end
  
end