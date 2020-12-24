FactoryBot.define do
  factory :credit do
    post_code       { '111-1111' }
    prefecture_id   { 3 }
    city            { 'テスト市' }
    house_number    { 'テスト1-1' }
    building_name   { 'テスト1' }
    tell_number     { '08011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id         { 1 }
    item_id         { 1 }
  end
end
