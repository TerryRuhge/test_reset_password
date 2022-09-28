require 'rails_helper'

RSpec.describe "assignments/index", type: :view do
  before(:each) do
    assign(:assignments, [
      Assignment.create!(
        assignment_id: "",
        request_id: 2,
        driver_id: 3,
        driver_notes: "Driver Notes",
        queue_pos: 4
      ),
      Assignment.create!(
        assignment_id: "",
        request_id: 2,
        driver_id: 3,
        driver_notes: "Driver Notes",
        queue_pos: 4
      )
    ])
  end

  it "renders a list of assignments" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Driver Notes".to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
