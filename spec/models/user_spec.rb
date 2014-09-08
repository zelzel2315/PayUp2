require 'rails_helper'

RSpec.describe User, type: :model do 

  it { should have_many(:user_bets) }
 	it { should have_many(:bets) }
	it { should accept_nested_attributes_for(:bets) }

end 

describe User do

  it "is valid with a username" do
  	user = FactoryGirl.build(:user)
  	expect(user).to be_valid
  end 

  it "is valid with an name" do
    # Here's an equivalent line to Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 6.0)
  	user = FactoryGirl.build(:user)
  	expect(user).to be_valid
  end 

  it "is valid with an email" do
    # Here's an equivalent line to Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 6.0)
  	user = FactoryGirl.build(:user)
  	expect(user).to be_valid
  end 
  
  it "is valid with a venmo_id" do
    # Here's an equivalent line to Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 6.0)
  	user = FactoryGirl.build(:user)
  	expect(user).to be_valid
  end

 end
