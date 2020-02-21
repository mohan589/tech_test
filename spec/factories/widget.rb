FactoryBot.define do
  factory :widget, class: Widget do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    kind { %w[visible hidden].sample }
  end
end
