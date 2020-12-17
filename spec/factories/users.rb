FactoryBot.define do
  factory :user do
    nickname               { 'test' }
    email                  { 'test@examlie' }
    password               { 'test000' }
    password_confirmation  { password }
    last_name              { '全' }
    first_name             { '角' }
    last_name_reading      { 'ゼン' }
    first_name_reading     { 'カク' }
    birthday               { Faker::Date.birthday(min_age: 5, max_age: 90) }
  end
end
