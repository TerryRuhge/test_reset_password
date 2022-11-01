require 'rails_helper'

RSpec.describe "whitelists/new", type: :view do
  before(:each) do
    assign(:whitelist, Whitelist.new(
      email: "MyString"
    ))
  end

  it "renders new whitelist form" do
    render

    assert_select "form[action=?][method=?]", whitelists_path, "post" do

      assert_select "input[name=?]", "whitelist[email]"
    end
  end
end
