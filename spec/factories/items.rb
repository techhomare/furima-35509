FactoryBot.define do
  factory :item do
    name                { 'あ' }
    image               { 'logo.png' }
    description         { 'あ' }
    price               { 1000 }
    category_id         { 2 }
    condition_id        { 2 }
    delivery_expense_id { 2 }
    prefectures_id      { 2 }
    fixed_date_id       { 2 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/logo.png'), filename: 'logo.png')
    end
  end
end
