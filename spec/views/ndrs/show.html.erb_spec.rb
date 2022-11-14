require 'rails_helper'

RSpec.describe "ndrs/show", type: :view do
  before(:each) do
    @ndr = assign(:ndr, Ndr.create!(
      ndr_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
