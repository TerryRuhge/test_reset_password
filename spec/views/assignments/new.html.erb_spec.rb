require 'rails_helper'

RSpec.describe "assignments/new", type: :view do
  before(:each) do
    assign(:assignment, Assignment.new(
      assignment_id: "",
      request_id: 1,
      driver_id: 1,
      driver_notes: "MyString",
      queue_pos: 1
    ))
  end

  it "renders new assignment form" do
    render

    assert_select "form[action=?][method=?]", assignments_path, "post" do

      assert_select "input[name=?]", "assignment[assignment_id]"

      assert_select "input[name=?]", "assignment[request_id]"

      assert_select "input[name=?]", "assignment[driver_id]"

      assert_select "input[name=?]", "assignment[driver_notes]"

      assert_select "input[name=?]", "assignment[queue_pos]"
    end
  end
end
