require 'rails_helper'

RSpec.describe User, type: :model do

  it "creates a user" do
    u = User.create({name: "testy"})
    expect(User.count).to eq(1)
  end

  it "has a factory (for other tests)" do
    u = FactoryGirl.create(:user)
    expect(User.count).to eq(1)
  end
  
end
