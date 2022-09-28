require 'rails_helper'

RSpec.describe "assignments/edit", type: :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      assignment_id: "",
      request_id: 1,
      driver_id: 1,
      driver_notes: "MyString",
      queue_pos: 1
    ))
  end

  it "renders the edit assignment form" do
    render

    assert_select "form[action=?][method=?]", assignment_path(@assignment), "post" do

      assert_select "input[name=?]", "assignment[assignment_id]"

      assert_select "input[name=?]", "assignment[request_id]"

      assert_select "input[name=?]", "assignment[driver_id]"

      assert_select "input[name=?]", "assignment[driver_notes]"

      assert_select "input[name=?]", "assignment[queue_pos]"
    end
  end
end
