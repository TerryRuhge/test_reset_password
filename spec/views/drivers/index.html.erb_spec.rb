require 'rails_helper'

RSpec.describe "drivers/index", type: :view do
  before(:each) do
    assign(:drivers, [
      Drivers.create!(),
      Drivers.create!()
    ])
  end

  it "renders a list of drivers" do
    render
  end
end
