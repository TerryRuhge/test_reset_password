require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        make: "Toyota",
        model: "Corolla",
        color: "White",
        plate_number: "LHV5314",
        registration_expiry: '2023-01-01'
      ),
      Car.create!(
        make: "Dodge",
        model: "Challenger",
        color: "Red",
        plate_number: "MB7QTL",
        registration_expiry: '2023-01-01'
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", text: "Toyota".to_s
    assert_select "tr>td", text: "Dodge".to_s
  end
end
