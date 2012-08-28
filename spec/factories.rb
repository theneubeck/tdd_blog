FactoryGirl.define do
  factory :post do
    title "Title"
    body  "Body " * 25
  end
end
