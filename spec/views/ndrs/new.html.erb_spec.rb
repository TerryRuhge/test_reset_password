require 'rails_helper'

RSpec.describe "ndrs/new", type: :view do
  before(:each) do
    assign(:ndr, Ndr.new(
      ndr_id: 1
    ))
  end

  it "renders new ndr form" do
    render

    assert_select "form[action=?][method=?]", ndrs_path, "post" do

      assert_select "input[name=?]", "ndr[ndr_id]"
    end
  end
end
