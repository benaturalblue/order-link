FactoryBot.define do
  factory :user do
    company_name          { Faker::Company.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false) + '1a' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    kana_last_name        { 'ヤマダ' }
    kana_first_name       { 'タロウ' }
    phone_number          { Faker::Number.number(digits: [10, 11].sample) }
  end
end