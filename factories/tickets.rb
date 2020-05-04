FactoryBot.define do

  factory :ticket do
    name { 'Default' }
    id { '1' }
    phone { '123-123-1234' }
  end

  factory :fake_ticket do
    name { 'Fake' }
    phone { '123-123-432'}
  end
end