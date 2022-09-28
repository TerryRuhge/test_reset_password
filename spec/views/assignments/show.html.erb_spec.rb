require 'rails_helper'

RSpec.describe "assignments/show", type: :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      assignment_id: "",
      request_id: 2,
      driver_id: 3,
      driver_notes: "Driver Notes",
      queue_pos: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Driver Notes/)
    expect(rendered).to match(/4/)
  end
end
