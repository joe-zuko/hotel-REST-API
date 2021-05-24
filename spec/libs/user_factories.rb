require_relative "../models/user_model"

FactoryBot.define do
  factory :registred_user, class: UserModel do
    id { 0 }
    login { Faker::Alphanumeric.alphanumeric(number: 20) }
    senha { Faker::Alphanumeric.alphanumeric(number: 10) }
    email { Faker::Internet.free_email(name: login) }

    after(:build) do |user|
      login = ApiUser.create(user.to_hash)
      result = ApiUser.auth(user.to_hash)
      user.token = result.parsed_response["access_token"]
      user.id = result.parsed_response["user_id"]
      user.email = result.parsed_response["user_email"]
    end
  end

  factory :new_user, class: UserModel do
    id { 0 }
    login { Faker::Alphanumeric.alphanumeric(number: 10) }
    senha { Faker::Alphanumeric.alphanumeric(number: 10) }
    email { Faker::Internet.free_email(name: login) }
  end

  factory :null_user, class: UserModel do
    senha { Faker::Alphanumeric.alphanumeric(number: 10) }
    email { Faker::Internet.free_email }
  end

  factory :empty_email_user, class: UserModel do
    login { Faker::JapaneseMedia::OnePiece.character }
    senha { Faker::Alphanumeric.alphanumeric(number: 10) }
    email { "" }
  end

  factory :null_email_user, class: UserModel do
    login { Faker::JapaneseMedia::OnePiece.character }
    senha { Faker::Alphanumeric.alphanumeric(number: 10) }
  end

  factory :null_password_user, class: UserModel do
    login { Faker::TvShows::Friends.character }
    email { Faker::Internet.free_email(name: login) }
  end

  # login user

  factory :empty_password_user_auth, class: UserModel do
    login { Faker::JapaneseMedia::OnePiece.character }
    senha { "" }
  end

  factory :wrong_password_user_auth, class: UserModel do
    login { "Joe" }
    senha { Faker::Alphanumeric.alphanumeric(number: 10) }
  end

  factory :empty_login_user_auth, class: UserModel do
    login { "" }
    senha { Faker::Alphanumeric.alphanumeric(number: 10) }
  end

  factory :wrong_login_user_auth, class: UserModel do
    login { "Joey" }
    senha { "Joe345Hadouken" }
  end
end
