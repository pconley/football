FactoryGirl.define do
  factory :team do
    year "2001"
    association :country, factory: :country
    # country_id 1
  end
end
