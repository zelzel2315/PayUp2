require 'rails_helper'

RSpec.describe Bet, type: :model do 

  	it { should have_many(:user_bets) }
 	it { should have_many(:users) }
	it { should accept_nested_attributes_for(:users) }
end

describe Bet do
	it { should state(:pending) }
end



