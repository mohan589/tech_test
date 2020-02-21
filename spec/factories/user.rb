FactoryBot.define do
  factory :user, class: User do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Config.random.seed }
    image_url { Faker::Internet.url + '/abc.png' }
  end
end
