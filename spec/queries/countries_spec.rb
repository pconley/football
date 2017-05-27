require 'uri'
require 'json'
require 'rails_helper'

def get_valid(query)
    get URI.escape("/worldcup?query=#{query}")
    expect(response).to have_http_status(200)
    data = JSON.parse(response.body)['data']
    puts "*** data: #{data}"
    return data
end

RSpec.describe "Countries", type: :request do
  describe "GET" do
    it "all countries" do
      FactoryGirl.create(:country)
      FactoryGirl.create(:country)
      data = get_valid("{countries{name}}")
      countries = data['countries']
      expect(countries.count).to eq(2)
    end
    it "one country" do
      FactoryGirl.create(:country, code:'DEN', name:'Denmark')
      data = get_valid('{country(code:"DEN"){name}}')
      country = data['country']
      expect(country['name']).to eq('Denmark')
    end
    it "nil country" do
      FactoryGirl.create(:country, code:'DEN', name:'Denmark')
      data = get_valid('{country(code:"XXX"){name}}')
      country = data['country']
      expect(country).to eq(nil)
    end

  end
end
