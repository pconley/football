require 'rails_helper'

RSpec.describe "teams/new", type: :view do
  before(:each) do
    assign(:team, Team.new(
      :year => "MyString",
      :country_id => 1
    ))
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", teams_path, "post" do

      assert_select "input[name=?]", "team[year]"

      assert_select "input[name=?]", "team[country_id]"
    end
  end
end
