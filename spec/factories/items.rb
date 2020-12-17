FactoryBot.define do
  factory :item do
    items_name          { 'test' }
    explanation         { 'test' }
    category_id         { 1 }
    condition_id        { 2 }
    delivery_free_id    { 3 }
    prefecture_id       { 4 }
    delivery_day_id     { 2 }
    price               { 4000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
