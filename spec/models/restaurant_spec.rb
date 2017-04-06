require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Restaurant.create(name: "Joe's Tavern")
    restaurant = Restaurant.new(name: "Joe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end

  it "belongs to a user" do
    restaurant = Restaurant.create(name: "Joe's Tavern")
    expect(restaurant).to belong_to :user
  end

  it "has many reviews" do
    restaurant = Restaurant.create(name: "Joe's Tavern")
    expect(restaurant).to have_many :reviews
  end

end
