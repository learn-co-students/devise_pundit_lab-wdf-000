FactoryGirl.define do
  factory :note do
    confirmed_at Time.now
    content "This is a test note!!!"
  end
end
