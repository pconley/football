require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      :year => "Year",
      :country => Country.create(name: "Transpenn")
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Year/)
  end
end
