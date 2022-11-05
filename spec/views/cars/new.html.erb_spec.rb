require 'rails_helper'

RSpec.describe "cars/new", type: :view do
  before(:each) do
    assign(:car, Car.new(
      make: "MyText",
      model: "MyText",
      color: "MyText",
      plate_number: "MyText",
      registration_expiry: '2023-01-01'
    ))
  end

  it "renders new car form" do
    render

    assert_select "form[action=?][method=?]", cars_path, "post" do

      assert_select "textarea[name=?]", "car[make]"

      assert_select "textarea[name=?]", "car[model]"

      assert_select "textarea[name=?]", "car[color]"

      assert_select "textarea[name=?]", "car[plate_number]"
    end
  end
end
