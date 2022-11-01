# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'whitelists/edit', type: :view do
  before(:each) do
    @whitelist = assign(:whitelist, Whitelist.create!(
                                      email: 'MyString'
                                    ))
  end

  it 'renders the edit whitelist form' do
    render

    assert_select 'form[action=?][method=?]', whitelist_path(@whitelist), 'post' do
      assert_select 'input[name=?]', 'whitelist[email]'
    end
  end
end
