FactoryBot.define do
  factory :order_address do
    postal_code    { '123-4567' }
    prefectures_id { 2 }
    municipality   { '横浜市緑区' }
    address        { '青山1-1-1' }
    phone_number   { '12345678901' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end