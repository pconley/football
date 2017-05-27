require 'rails_helper'

RSpec.describe "countries/new", type: :view do
  before(:each) do
    assign(:country, Country.new(
      :name => "MyString",
      :code => "MyString",
      :cc => "",
      :cn => "MyString"
    ))
  end

  it "renders new country form" do
    render

    assert_select "form[action=?][method=?]", countries_path, "post" do

      assert_select "input[name=?]", "country[name]"

      assert_select "input[name=?]", "country[code]"

      assert_select "input[name=?]", "country[cc]"

      assert_select "input[name=?]", "country[cn]"
    end
  end
end
