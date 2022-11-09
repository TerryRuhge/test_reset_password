FactoryBot.define do
  factory :car do
    make { "MyText" }
    model { "MyText" }
    color { "MyText" }
    plate_number { "MyText" }
    registration_expiry { "2022-11-02" }
  end
end
