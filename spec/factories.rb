FactoryGirl.define do
  factory :user do
    email       "owner@dartmouth.edu"
    first_name  "Jenny"
    last_name   "Craig"
    password    "foobar"
  end

  factory :dress do
    owner_id      1
    brand         "Chanel"
    color         "Black"
    size          "Small"
    body_type     "Pair"
    notes         "fits snug"
    rent          10
  end
end
