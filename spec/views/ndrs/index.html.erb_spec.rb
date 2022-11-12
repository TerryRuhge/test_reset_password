require 'rails_helper'

RSpec.describe "ndrs/index", type: :view do
  before(:each) do
    assign(:ndrs, [
      Ndr.create!(
        ndr_id: 2
      ),
      Ndr.create!(
        ndr_id: 2
      )
    ])
  end

  it "renders a list of ndrs" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
