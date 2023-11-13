FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    introduction { Faker::Lorem.sentence }
    category_id { 2 } # Category.all.sample.idの中から１以外の情報を取り出したい時
    status_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    number_of_days_id { 2 }
    price { '11111' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
