require 'rails_helper'

RSpec.describe "drivers/new", type: :view do
  before(:each) do
    assign(:drivers, Drivers.new())
  end

  it "renders new drivers form" do
    render

    assert_select "form[action=?][method=?]", drivers_index_path, "post" do
    end
  end
end
