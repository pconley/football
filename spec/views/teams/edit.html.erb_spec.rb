require 'rails_helper'

RSpec.describe "teams/edit", type: :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      :year => "MyString",
      :country => Country.create(name:"Dinovia")
    ))
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(@team), "post" do

      assert_select "input[name=?]", "team[year]"

      assert_select "input[name=?]", "team[country_id]"
    end
  end
end
