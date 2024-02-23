FactoryBot.define do
  factory :event do
    event_name { "event" }
    event_cat { "concerty" }
    event_date { "2024-02-14" }
    event_start_time { "2024-02-14 14:25:56" }
    event_end_time { "2024-02-14 14:25:56" }
    ticket_price { "15" }
    no_of_seats { 100 }
  end
end