require 'rails_helper'

RSpec.describe Bet, type: :model do 

  	it { should have_many(:user_bets) }
 	it { should have_many(:users) }
	it { should accept_nested_attributes_for(:users) }
end

describe Bet do

  it "is valid with a challenge" do
  	bet = FactoryGirl.build(:bet)
  	expect(bet).to be_valid
  end 

  it "is valid with an amount" do
    # Here's an equivalent line to Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 6.0)
  	bet = FactoryGirl.build(:bet)
  	expect(bet).to be_valid
  end 

  it "is valid if accepted" do
    # Here's an equivalent line to Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 6.0)
  	bet = FactoryGirl.build(:bet)
  	expect(bet).to be_valid
  end 
  
  it "is valid with a winner_id" do
    # Here's an equivalent line to Yogurt.new(flavor: "plain", topping: "blueberries", quantity: 6.0)
  	bet = FactoryGirl.build(:bet)
  	expect(bet).to be_valid
  end 

  it "is not valid if the bet is not accepted" do
  	bet = Bet.new(challenge: "foot race", winner_id: 4, amount: 1.00, is_accepted: false)
  	expect(bet).to be_invalid 
  end

 end
