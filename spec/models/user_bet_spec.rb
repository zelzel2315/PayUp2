require 'rails_helper'

RSpec.describe UserBet, type: :model do 

  	it { should belong_to(:bet) }
 	it { should belong_to(:user) }
	it { should accept_nested_attributes_for(:bet) }
end



