require 'rails_helper'

RSpec.describe "whitelists/index", type: :view do
  before(:each) do
    assign(:whitelists, [
      Whitelist.create!(
        email: "Email"
      ),
      Whitelist.create!(
        email: "Email"
      )
    ])
  end

  it "renders a list of whitelists" do
    render
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
