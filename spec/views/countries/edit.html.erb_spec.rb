require 'rails_helper'

RSpec.describe "countries/edit", type: :view do
  before(:each) do
    @country = assign(:country, Country.create!(
      :name => "MyString",
      :code => "MyString",
      :cc => "",
      :cn => "MyString"
    ))
  end

  it "renders the edit country form" do
    render

    assert_select "form[action=?][method=?]", country_path(@country), "post" do

      assert_select "input[name=?]", "country[name]"

      assert_select "input[name=?]", "country[code]"

      assert_select "input[name=?]", "country[cc]"

      assert_select "input[name=?]", "country[cn]"
    end
  end
end
