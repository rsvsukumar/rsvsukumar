require 'faker'
FactoryGirl.define do
  factory :publisher do
    name{Faker::Name.name }
    address{ Faker::Address.street_name}
    city {Faker::Address.city}
    state{ Faker::Address.state_abbr}
    zip{ "12345"}
    phone{ "000-000-0000"}
    url{ Faker::Internet.url}
  end
end