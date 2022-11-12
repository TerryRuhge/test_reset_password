require 'rails_helper'

RSpec.describe "ndrs/edit", type: :view do
  before(:each) do
    @ndr = assign(:ndr, Ndr.create!(
      ndr_id: 1
    ))
  end

  it "renders the edit ndr form" do
    render

    assert_select "form[action=?][method=?]", ndr_path(@ndr), "post" do

      assert_select "input[name=?]", "ndr[ndr_id]"
    end
  end
end
