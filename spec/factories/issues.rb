FactoryBot.define do
  factory :issue do
    sequence(:title) { |n| "Issue #{n}" }
    description { "Lorem ipsum dolor sit amet consectetur" }
    association(:reporter, factory: :user)
  end
end
