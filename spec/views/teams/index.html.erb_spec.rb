require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
        :year => "Year1", :country => Country.create(name:"Dinovia")
      ),
      Team.create!(
        :year => "Year2", :country => Country.create(name:"Tinovia")
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", :text => "Year1".to_s, :count => 1
  end
end
