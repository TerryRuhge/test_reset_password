require 'rails_helper'

RSpec.describe "drivers/show", type: :view do
  before(:each) do
    @drivers = assign(:drivers, Drivers.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
