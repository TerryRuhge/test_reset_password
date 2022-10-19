require 'rails_helper'

RSpec.describe "drivers/edit", type: :view do
  before(:each) do
    @drivers = assign(:drivers, Drivers.create!())
  end

  it "renders the edit drivers form" do
    render

    assert_select "form[action=?][method=?]", drivers_path(@drivers), "post" do
    end
  end
end
