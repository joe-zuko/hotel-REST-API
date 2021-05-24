require_relative "../models/hotel_model"

FactoryBot.define do
  factory :new_hotel, class: HotelModel do
    nome { Faker::Name.name }
    estrelas { Faker::Number.within(range: 0.0..5.0) }
    diaria { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    cidade { Faker::Address.state }
    site { Faker::Number.between(from: 1, to: 2) }
  end

  factory :update_hotel, class: HotelModel do
    nome { Faker::Name.name }
    estrelas { Faker::Number.within(range: 0.0..5.0) }
    diaria { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    cidade { Faker::Address.state }
    site { Faker::Number.between(from: 1, to: 2) }
  end
end
