FactoryBot.define do
  factory :ticket do
    user
    event
    no_of_seats { 10 }
    total_price { 50 }
  end
end