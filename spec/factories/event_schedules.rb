FactoryBot.define do
  factory :event_schedule do
    title { "MyString" }
    start_date { "2024-12-29" }
    end_date { "2024-12-29" }
    all_day { false }
    memo { "MyText" }
  end
end
