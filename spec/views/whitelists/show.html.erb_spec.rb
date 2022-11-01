require 'rails_helper'

RSpec.describe "whitelists/show", type: :view do
  before(:each) do
    @whitelist = assign(:whitelist, Whitelist.create!(
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
  end
end
